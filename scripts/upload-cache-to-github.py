#!/usr/bin/env python3
from __future__ import print_function

import argparse
import hashlib
import json
import os
import requests
import sys
import time

if os.getenv('HUNTER_GIT_EXECUTABLE'):
  os.environ["GIT_PYTHON_GIT_EXECUTABLE"] = os.getenv('HUNTER_GIT_EXECUTABLE')

try:
  import git
except ImportError as exc:
  print("Import failed with error: {}".format(exc))
  print("Possible fixes:")
  print(" * Install gitpython module: 'pip install gitpython'")
  print(" * Set environment variable HUNTER_GIT_EXECUTABLE")
  sys.exit(1)

class Error(Exception):
  pass

def sleep_time(attempt):
  if attempt <= 0:
    raise Exception('Unexpected')
  if attempt == 1:
    return 0
  if attempt == 2:
    return 15
  if attempt == 3:
    return 60
  if attempt == 4:
    return 90
  if attempt == 5:
    return 300
  return 1200

def retry(func_in):
  def func_out(*args, **kwargs):
    retry_max = 10
    i = 0
    while True:
      i = i + 1
      try:
        return func_in(*args, **kwargs)
      except Error as err:
        # Treat Errors as fatal and do not retry.
        # Also explicitly flush message to avoid "no output" issue on some CIs.
        print('Error:\n  {}'.format(err))
        sys.stdout.flush()
        raise err
      except Exception as exc:
        if i > retry_max:
          raise exc
        print('Operation failed. Exception:\n  {}'.format(exc))
        sec = sleep_time(i)
        print('Retry #{} (of {}) after {} seconds'.format(i, retry_max, sec))
        sys.stdout.flush()
        time.sleep(sec)
  return func_out

class Github:
  def __init__(self, username, password, repo_owner, repo):
    self.repo_owner = repo_owner
    self.repo = repo
    self.username = username
    self.password = password
    self.auth = requests.auth.HTTPBasicAuth(username, password)
    self.simple_request()

  @retry
  def simple_request(self):
    print('Processing simple request')
    r = requests.get('https://api.github.com', auth=self.auth)
    if not r.ok:
      sys.exit('Simple request fails. Check your password.')

    limit = int(r.headers['X-RateLimit-Remaining'])
    print('GitHub Limit: {}'.format(limit))
    if limit == 0:
      raise Exception('GitHub limit is 0')
    print('Simple request pass')

  @retry
  def get_release_by_tag(self, tagname):
    print('Get release-id by tag `{}`'.format(tagname))
    # https://developer.github.com/v3/repos/releases/#get-a-release-by-tag-name
    # GET /repos/:owner/:repo/releases/tags/:tag

    url = 'https://api.github.com/repos/{}/{}/releases/tags/{}'.format(
        self.repo_owner,
        self.repo,
        tagname
    )

    r = requests.get(url, auth=self.auth)
    if r.status_code == 404:
        # Create release if not exists
        # https://developer.github.com/v3/repos/releases/#create-a-release
        # POST /repos/:owner/:repo/releases

        post_url = 'https://api.github.com/repos/{}/{}/releases'.format(
            self.repo_owner,
            self.repo,
        )
        tag_data = "{" + '"tag_name": "{}"'.format(tagname) + "}"
        r = requests.post(post_url, data=tag_data, auth=self.auth)
        repo_name = "https://github.com/{}/{}".format(
            self.repo_owner, self.repo
        )
        if r.status_code == 404:
            raise Error(
                "Repository not found '{}' or user '{}' has no access to it".
                    format(repo_name, self.username)
            )
        if r.status_code == 422:
            raise Error(
                "Please create at least one file in repository '{}'".
                    format(repo_name)
            )
        if not r.status_code == 201:
            raise Error("Unexpected status code: {}".format(r.status_code))
        if not r.ok:
            raise Error("Can't create release tag {}".format(tagname))
        r = requests.get(url, auth=self.auth)

    if not r.ok:
        raise Exception(
            'Get release id failed. Status code: {}. Requested url: {}'.format(
                r.status_code, url))

    release_id = r.json()['id']
    upload_url = r.json()['upload_url']
    uri_template_vars = '{?name,label}'
    if uri_template_vars not in upload_url:
        raise Exception('Unsupported upload URI template: {}'.format(upload_url))
    upload_url = upload_url.replace(uri_template_vars, '?name={}')
    print('Release id: {}'.format(release_id))
    print('Upload URL: {}'.format(upload_url))
    return release_id, upload_url

  @retry
  def find_asset_id_by_name(self, release_id, name):
    # https://developer.github.com/v3/repos/releases/#list-assets-for-a-release
    # GET /repos/:owner/:repo/releases/:id/assets

    page_number = 1
    keep_searching = True

    while keep_searching:
      url = 'https://api.github.com/repos/{}/{}/releases/{}/assets?page={}'.format(
          self.repo_owner,
          self.repo,
          release_id,
          page_number
      )

      print('Requesting URL: {}'.format(url))
      r = requests.get(url, auth=self.auth)
      if not r.ok:
        raise Exception('Getting list of assets failed. Requested url: {}'.format(url))

      json = r.json()

      for x in json:
        if name == x['name']:
          return x['id']

      if not json:
        keep_searching = False

      page_number = page_number + 1

    return None

  @retry
  def delete_asset_by_id(self, asset_id, asset_name):
    # https://developer.github.com/v3/repos/releases/#delete-a-release-asset
    # DELETE /repos/:owner/:repo/releases/assets/:id

    url = 'https://api.github.com/repos/{}/{}/releases/assets/{}'.format(
        self.repo_owner,
        self.repo,
        asset_id
    )

    r = requests.delete(url, auth=self.auth)
    if r.status_code == 204:
      print('Asset removed: {}'.format(asset_name))
    else:
      raise Exception('Deletion of asset failed: {}'.format(asset_name))

  def delete_asset_if_exists(self, release_id, asset_name):
    asset_id = self.find_asset_id_by_name(release_id, asset_name)
    if not asset_id:
      print('Asset not exists: {}'.format(asset_name))
      return
    self.delete_asset_by_id(asset_id, asset_name)

  def upload_bzip_once(self, url, local_path):
    headers = {'Content-Type': 'application/x-bzip2'}
    file_to_upload = open(local_path, 'rb')
    r = requests.post(url, data=file_to_upload, headers=headers, auth=self.auth)
    if not r.ok:
      raise Exception('Upload of file failed')

  @retry
  def upload_bzip(self, url, local_path, release_id, asset_name):
    print('Uploading:\n  {}\n  -> {}'.format(local_path, url))
    try:
      self.upload_bzip_once(url, local_path)
    except Exception as exc:
      print('Exception catched while uploading, removing asset...')
      self.delete_asset_if_exists(release_id, asset_name)
      raise exc

  def upload_raw_file(self, local_path):
    asset_name = hashlib.sha1(open(local_path, 'rb').read()).hexdigest()

    tagname = 'cache-{}'.format(asset_name[0:7])
    asset_name = asset_name + '.tar.bz2'

    release_id, upload_url = self.get_release_by_tag(tagname)

    # https://developer.github.com/v3/repos/releases/#upload-a-release-asset
    # POST to upload_url received in the release description
    # in get_release_by_tag()

    url = upload_url.format(asset_name)
    self.upload_bzip(url, local_path, release_id, asset_name)

class CacheEntry:
  def __init__(self, cache_done_path, cache_dir):
    self.cache_dir = cache_dir
    self.cache_raw = os.path.join(self.cache_dir, 'raw')
    self.cache_done_path = cache_done_path
    if not os.path.exists(cache_done_path):
      raise Exception('File not exists: {}'.format(cache_done_path))
    self.cache_done_dir = os.path.dirname(self.cache_done_path)
    self.from_server = os.path.join(self.cache_done_dir, 'from.server')
    self.cache_sha1 = os.path.join(self.cache_done_dir, 'cache.sha1')

  def entry_from_server(self):
    return os.path.exists(self.from_server)

  def upload_raw(self, github):
    sha1 = open(self.cache_sha1, 'r').read()
    if sha1 == '':
      sys.exit('File with no content: {}'.format(self.cache_sha1))
    raw = os.path.join(self.cache_raw, sha1 + '.tar.bz2')
    if os.path.exists(raw):
      github.upload_raw_file(raw)

    # else:
    # FIXME (old GitHub API upload): https://travis-ci.org/ingenue/hunter/jobs/347888167
    # New Git-based upload: 'from.server' not present for old cache

  def touch_from_server(self):
    open(self.from_server, 'w')

class Cache:
  def __init__(self, cache_dir):
    self.cache_meta = os.path.join(cache_dir, 'meta')
    self.repo = git.Repo.init(self.cache_meta)

    self.entries = self.create_entries(cache_dir)
    self.remove_entries_from_server()

  def create_entries(self, cache_dir):
    print('Searching for CACHE.DONE files in directory:\n  {}\n'.format(cache_dir))

    entries = []
    for x in self.repo.untracked_files:
      if x.endswith('CACHE.DONE'):
        entries.append(CacheEntry(os.path.join(self.cache_meta, x), cache_dir))
    print('Found {} files'.format(len(entries)))
    return entries

  def remove_entries_from_server(self):
    new_entries = []
    for i in self.entries:
      if not i.entry_from_server():
        new_entries.append(i)
    self.entries = new_entries

  def upload_raw(self, github):
    for i in self.entries:
      i.upload_raw(github)

  def make_commit_message(self):
    message = 'Uploading cache info\n\n'

    env_list = []
    job_url = ''

    if os.getenv('TRAVIS') == 'true':
      # * https://docs.travis-ci.com/user/environment-variables/#Default-Environment-Variables
      message += 'Travis:\n'
      job_url = 'https://travis-ci.org/{}/jobs/{}'.format(
          os.getenv('TRAVIS_REPO_SLUG'),
          os.getenv('TRAVIS_JOB_ID')
      )

      env_list += [
          'TRAVIS_BRANCH',
          'TRAVIS_BUILD_ID',
          'TRAVIS_BUILD_NUMBER',
          'TRAVIS_JOB_ID',
          'TRAVIS_JOB_NUMBER',
          'TRAVIS_OS_NAME',
          'TRAVIS_REPO_SLUG'
      ]

    if os.getenv('APPVEYOR') == 'True':
      # * http://www.appveyor.com/docs/environment-variables
      message += 'AppVeyor:\n'
      job_url = 'https://ci.appveyor.com/project/{}/{}/build/{}/job/{}'.format(
          os.getenv('APPVEYOR_ACCOUNT_NAME'),
          os.getenv('APPVEYOR_PROJECT_SLUG'),
          os.getenv('APPVEYOR_BUILD_VERSION'),
          os.getenv('APPVEYOR_JOB_ID')
      )
      env_list += [
          'APPVEYOR_ACCOUNT_NAME',
          'APPVEYOR_PROJECT_ID',
          'APPVEYOR_PROJECT_NAME',
          'APPVEYOR_PROJECT_SLUG',
          'APPVEYOR_BUILD_ID',
          'APPVEYOR_BUILD_NUMBER',
          'APPVEYOR_BUILD_VERSION',
          'APPVEYOR_JOB_ID',
          'APPVEYOR_JOB_NAME',
          'APPVEYOR_REPO_BRANCH'
      ]

    # Store some info about build
    for env_name in env_list:
      env_value = os.getenv(env_name)
      if env_value:
        message += '  {}: {}\n'.format(env_name, env_value)

    if job_url:
      message += '\n  Job URL: {}\n'.format(job_url)

    return message

  def try_to_push(self, main_remote, main_remote_url_pull, github):
    try:
      main_remote.set_url(
          'https://{}:{}@github.com/{}/{}'.format(
              github.username,
              github.password,
              github.repo_owner,
              github.repo
          )
      )
      fetch_result = main_remote.pull(
          allow_unrelated_histories=True,
          strategy='recursive',
          strategy_option='ours',
          rebase=True,
          depth=1
      )
      main_remote.set_url(main_remote_url_pull)
      for x in fetch_result:
        if x.flags & x.REJECTED:
          print('Pull rejected')
          return False
        if x.flags & x.ERROR:
          print('Pull error')
          return False
    except Exception as exc:
      print("Pull failed: {}".format(exc))
      return False

    try:
      main_remote.set_url(
          'https://{}:{}@github.com/{}/{}'.format(
              github.username,
              github.password,
              github.repo_owner,
              github.repo
          )
      )
      push_result = main_remote.push()
      main_remote.set_url(main_remote_url_pull)
      for x in push_result:
        if x.flags & x.ERROR:
          print('Push error')
          return False
        if x.flags & x.REJECTED:
          print('Push rejected')
          return False
        if x.flags & x.REMOTE_FAILURE:
          print('Push remote failure')
          return False
        if x.flags & x.REMOTE_REJECTED:
          print('Push remote rejected')
          return False
    except:
      # No exceptions expected, exit to avoid leakage of token
      sys.exit('Unexpected exception')

    return True

  def upload_meta(self, github, cache_dir):
    config = self.repo.config_writer()
    config.set_value(
        "user",
        "email",
        "{}@users.noreply.github.com".format(github.username)
    )
    config.set_value("user", "name", github.username)
    if sys.platform == "win32":
      config.set_value("core", "autocrlf", "input")
    config.release()

    if self.repo.is_dirty(untracked_files=True):
      print('Adding untracked files:')
      add_list = []

      for x in self.repo.untracked_files:
        to_add = False
        if x.endswith('toolchain.info'):
          to_add = True
        elif x.endswith('args.cmake'):
          to_add = True
        elif x.endswith('types.info'):
          to_add = True
        elif x.endswith('internal_deps.id'):
          to_add = True
        elif x.endswith('basic-deps.info'):
          to_add = True
        elif x.endswith('basic-deps.DONE'):
          to_add = True
        elif x.endswith('cache.sha1'):
          to_add = True
        elif x.endswith('deps.info'):
          to_add = True
        elif x.endswith('CACHE.DONE'):
          to_add = True
        elif x.endswith('SHA1'):
          to_add = True

        if to_add:
          print(' * {}'.format(x))
          add_list.append(x)

      sys.stdout.flush()

      self.repo.index.add(add_list)
      self.repo.index.commit(self.make_commit_message())

    main_branch_found = False
    for branch in self.repo.branches:
      if branch.name == 'master':
        main_branch_found = True

    if not main_branch_found:
      self.repo.git.branch('master')

    main_remote_found = False
    for remote in self.repo.remotes:
      if remote.name == 'origin':
        main_remote_found = True
        main_remote = remote

    main_remote_url_pull = 'https://github.com/{}/{}'.format(
        github.repo_owner, github.repo
    )

    if not main_remote_found:
      main_remote = self.repo.create_remote('origin', main_remote_url_pull)

    retry_max = 10

    fetch_ok = False

    for i in range(1, retry_max):
      try:
        if fetch_ok:
          break
        print('Fetch remote (attempt #{})'.format(i))
        sys.stdout.flush()

        main_remote.set_url(
            'https://{}:{}@github.com/{}/{}'.format(
                github.username,
                github.password,
                github.repo_owner,
                github.repo
            )
        )
        main_remote.fetch(depth=1)
        main_remote.set_url(main_remote_url_pull)
        fetch_ok = True
      except Exception as exc:
        print('Exception {}'.format(exc))

    if not fetch_ok:
      sys.exit('Fetch failed')

    self.repo.heads.master.set_tracking_branch(main_remote.refs.master)

    success = False

    for i in range(1, retry_max):
      print("Attempt #{}".format(i))
      success = self.try_to_push(main_remote, main_remote_url_pull, github)
      if success:
        break
      sec = sleep_time(i)
      print('Retry #{} (of {}) after {} seconds'.format(i, retry_max, sec))
      sys.stdout.flush()
      time.sleep(sec)

    if success:
      print("Done")
    else:
      sys.exit("Can't push")

  def touch_from_server(self):
    for i in self.entries:
      i.touch_from_server()

parser = argparse.ArgumentParser(
    description='Script for uploading Hunter cache files to GitHub'
)

parser.add_argument(
    '--username',
    required=True,
    help='Username'
)

parser.add_argument(
    '--password',
    required=True,
    help='Password'
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

args = parser.parse_args()

cache_dir = os.path.normpath(args.cache_dir)

# Some tests don't produce cache for some toolchains:
# * https://travis-ci.org/ingenue/hunter/jobs/185550289
if not os.path.exists(cache_dir):
  print("*** WARNING *** Cache directory '{}' not found, skipping...".format(cache_dir))
  sys.exit()

if not os.path.isdir(cache_dir):
  raise Exception('Not a directory: {}'.format(cache_dir))

if os.path.split(cache_dir)[1] != 'Cache':
  raise Exception('Cache directory path should ends with Cache: {}'.format(cache_dir))

cache = Cache(cache_dir)

password = args.password

if password == '' or password is None:
  raise Exception('No password provided')

github = Github(
    username = args.username,
    password = password,
    repo_owner = args.repo_owner,
    repo = args.repo
)

cache.upload_raw(github)

cache.upload_meta(github, cache_dir)
print('Touch from.server files')
cache.touch_from_server()
