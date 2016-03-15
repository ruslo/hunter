#!/usr/bin/env python3

import argparse
import base64
import hashlib
import json
import os
import requests
import sys
import time

# http://stackoverflow.com/a/16696317/2288008
def download_file_once(url, local_file, chunk_size=1024):
  r = requests.get(url, stream=True)
  if not r.ok:
    raise Exception('Downloading failed')
  with open(local_file, 'wb') as f:
    for chunk in r.iter_content(chunk_size=chunk_size):
      if chunk:
        f.write(chunk)

def download_file(url, local_file):
  print('Downloading file to: {}'.format(local_file))
  max_retry = 3
  for i in range(max_retry):
    try:
      download_file_once(url, local_file)
      print('Done')
      return
    except Exception as exc:
      print('Exception catched ({}), retry... ({} of {})'.format(exc, i+1, max_retry))
      time.sleep(15)
  sys.exit('Download failed')

def upload_bzip_once(url, local_path):
  headers = {'Content-Type': 'application/x-bzip2'}
  file_to_upload = open(local_path, 'rb')
  r = requests.post(url, data=file_to_upload, headers=headers)
  if not r.ok:
    raise Exception('Upload of file failed')

def upload_bzip(url, local_path):
  print('Uploading file: {}'.format(local_path))
  max_retry = 3
  for i in range(max_retry):
    try:
      upload_bzip_once(url, local_path)
      print('Done')
      return
    except Exception as exc:
      print('Exception catched ({}), retry... ({} of {})'.format(exc, i+1, max_retry))
      time.sleep(15)
  sys.exit('Upload failed')

class Github:
  def __init__(self, username, password, repo_owner, repo):
    self.username = username
    self.password = password
    self.repo_owner = repo_owner
    self.repo = repo

    r = requests.get(
        'https://{}:{}@api.github.com/repos/{}'.format(
            self.username,
            self.password,
            repo_owner,
        )
    )
    limit = int(r.headers['X-RateLimit-Remaining'])
    print('GitHub Limit: {}'.format(limit))
    if limit == 0:
      sys.exit('GitHub limit is 0, have to wait some time...')

  def get_release_by_tag(self, tagname):
    # https://developer.github.com/v3/repos/releases/#get-a-release-by-tag-name
    # GET /repos/:owner/:repo/releases/tags/:tag

    url = 'https://{}:{}@api.github.com/repos/{}/{}/releases/tags/{}'.format(
        self.username,
        self.password,
        self.repo_owner,
        self.repo,
        tagname
    )

    r = requests.get(url)
    if not r.ok:
      raise Exception('Get tag id failed')

    return r.json()['id']

  def upload_raw_file(self, local_path):
    tagname = 'cache'
    release_id = self.get_release_by_tag(tagname)

    # https://developer.github.com/v3/repos/releases/#upload-a-release-asset
    # POST https://<upload_url>/repos/:owner/:repo/releases/:id/assets?name=foo.zip

    asset_name = hashlib.sha1(open(local_path, 'rb').read()).hexdigest()
    asset_name = asset_name + '.tar.bz2'

    url = 'https://{}:{}@uploads.github.com/repos/{}/{}/releases/{}/assets?name={}'.format(
        self.username,
        self.password,
        self.repo_owner,
        self.repo,
        release_id,
        asset_name
    )

    upload_bzip(url, local_path)

  def create_new_file(self, local_path, github_path):
    # https://developer.github.com/v3/repos/contents/#create-a-file
    # PUT /repos/:owner/:repo/contents/:path

    message = 'Create file: {}'.format(github_path)

    url = 'https://{}:{}@api.github.com/repos/{}/{}/contents/{}'.format(
        self.username,
        self.password,
        self.repo_owner,
        self.repo,
        github_path
    )

    content = base64.b64encode(open(local_path, 'rb').read()).decode()

    put_data = {
        'message': message,
        'content': content
    }

    r = requests.put(url, data = json.dumps(put_data))
    return r.ok

class CacheEntry:
  def __init__(self, cache_done_path, cache_dir, temp_dir):
    self.cache_dir = cache_dir
    self.temp_dir = temp_dir
    self.cache_raw = os.path.join(self.cache_dir, 'raw')
    self.cache_meta = os.path.join(self.cache_dir, 'meta')
    self.cache_done_path = cache_done_path
    if not os.path.exists(cache_done_path):
      raise Exception('File not exists: {}'.format(cache_done_path))
    self.cache_done_dir = os.path.dirname(self.cache_done_path)
    self.from_server = os.path.join(self.cache_done_dir, 'from.server')
    self.cache_sha1 = os.path.join(self.cache_done_dir, 'cache.sha1')

    self.internal_deps_id = os.path.split(self.cache_done_dir)[0]
    self.type_id = os.path.split(self.internal_deps_id)[0]
    self.args_id = os.path.split(self.type_id)[0]
    self.archive_id = os.path.split(self.args_id)[0]
    self.version = os.path.split(self.archive_id)[0]
    self.component = os.path.split(self.version)[0]
    if os.path.split(self.component)[1].startswith('__'):
      self.package = os.path.split(self.component)[0]
    else:
      self.package = self.component
      self.component = ''
    self.toolchain_id = os.path.split(self.package)[0]
    meta = os.path.split(self.toolchain_id)[0]
    assert(meta == self.cache_meta)

  def entry_from_server(self):
    return os.path.exists(self.from_server)

  def upload_raw(self, github):
    sha1 = open(self.cache_sha1, 'r').read()
    raw = os.path.join(self.cache_raw, sha1 + '.tar.bz2')
    github.upload_raw_file(raw)

  def upload_meta(self, github, cache_done):
    self.upload_files_from_common_dir(github, self.cache_done_dir, cache_done)
    self.upload_files_from_common_dir(github, self.internal_deps_id)
    self.upload_files_from_common_dir(github, self.type_id)
    self.upload_files_from_common_dir(github, self.args_id)
    self.upload_files_from_common_dir(github, self.archive_id)
    self.upload_files_from_common_dir(github, self.version, check_is_empty=True)
    if self.component != '':
      self.upload_files_from_common_dir(github, self.component, check_is_empty=True)
    self.upload_files_from_common_dir(github, self.package, check_is_empty=True)
    self.upload_files_from_common_dir(github, self.toolchain_id)

  def upload_files_from_common_dir(self, github, dir_path, cache_done=False, check_is_empty=False):
    to_upload = []
    for i in os.listdir(dir_path):
      if i == 'cmake.lock':
        continue
      if i == 'DONE':
        continue
      if i == 'CACHE.DONE' and not cache_done:
        continue
      i_fullpath = os.path.join(dir_path, i)
      if os.path.isfile(i_fullpath):
        to_upload.append(i_fullpath)
    if check_is_empty and len(to_upload) != 0:
      raise Exception('Expected no files in directory: {}'.format(dir_path))
    if not check_is_empty and len(to_upload) == 0:
      raise Exception('No files found in directory: {}'.format(dir_path))
    for i in to_upload:
      relative_path = i[len(self.cache_meta)+1:]
      expected_download_url = 'https://{}:{}@raw.githubusercontent.com/{}/{}/master/{}'.format(
          github.username,
          github.password,
          github.repo_owner,
          github.repo,
          relative_path
      )
      print('Uploading file: {}'.format(relative_path))
      ok = github.create_new_file(i, relative_path)
      if not ok:
        print('Already exist')
        temp_file = os.path.join(self.temp_dir, '__TEMP.FILE')
        download_file(expected_download_url, temp_file)
        expected_hash = hashlib.sha1(open(i, 'rb').read()).hexdigest()
        downloaded_hash = hashlib.sha1(open(temp_file, 'rb').read()).hexdigest()
        os.remove(temp_file)
        if expected_hash != downloaded_hash:
          raise Exception('Hash mismatch:\n  {} != {}\n  {}'.format(expected_hash, downloaded_hash, expected_download_url))

class Cache:
  def __init__(self, cache_dir, temp_dir):
    self.entries = self.create_entries(cache_dir, temp_dir)
    self.remove_entries_from_server()
    if not os.path.exists(temp_dir):
      os.makedirs(temp_dir)

  def create_entries(self, cache_dir, temp_dir):
    print('Searching for CACHE.DONE files in directory:\n  {}\n'.format(cache_dir))
    entries = []
    for root, dirs, files in os.walk(cache_dir):
      for filename in files:
        if filename == 'CACHE.DONE':
          entries.append(CacheEntry(os.path.join(root, filename), cache_dir, temp_dir))
    print('Found {} files:'.format(len(entries)))
    for i in entries:
      print('  {}'.format(i.cache_done_path))
    print('')
    return entries

  def remove_entries_from_server(self):
    new_entries = []
    for i in self.entries:
      if i.entry_from_server():
        print('Remove entry (from server):\n  {}'.format(i.cache_done_path))
      else:
        new_entries.append(i)
    self.entries = new_entries

  def upload_raw(self, github):
    for i in self.entries:
      i.upload_raw(github)

  def upload_meta(self, github, cache_done):
    for i in self.entries:
      i.upload_meta(github, cache_done)

parser = argparse.ArgumentParser(
    description='Script for uploading Hunter cache files to GitHub'
)

parser.add_argument(
    '--username',
    required=True,
    help='Username'
)

parser.add_argument(
    '--repo-owner',
    required=True,
    help='Repository owner'
)

parser.add_argument(
    '--repo',
    required=True,
    help='Repository name'
)

parser.add_argument(
    '--cache-dir',
    required=True,
    help='Hunter cache directory, e.g. /home/user/.hunter/_Base/Cache'
)

parser.add_argument(
    '--temp-dir',
    required=True,
    help='Temporary directory where files will be downloaded for verification'
)

args = parser.parse_args()

cache_dir = os.path.normpath(args.cache_dir)

if not os.path.isdir(cache_dir):
  raise Exception('Not a directory: {}'.format(cache_dir))

if os.path.split(cache_dir)[1] != 'Cache':
  raise Exception('Cache directory path should ends with Cache: {}'.format(cache_dir))

cache = Cache(cache_dir, args.temp_dir)

password = os.getenv('GITHUB_USER_PASSWORD')

if password == '' or password is None:
  raise Exception('Expected GITHUB_USER_PASSWORD environment variable')

github = Github(
    username = args.username,
    password = password,
    repo_owner = args.repo_owner,
    repo = args.repo
)

cache.upload_raw(github)
cache.upload_meta(github, cache_done=False)
cache.upload_meta(github, cache_done=True) # Should be last
