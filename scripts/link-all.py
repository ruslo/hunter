#!/usr/bin/env python3

import argparse
import os
import sys
import multiprocessing

parser = argparse.ArgumentParser(description='File link script')

parser.add_argument('--list', required=True)
parser.add_argument('--cellar', required=True)
parser.add_argument('--dest', required=True)

cmd_args = parser.parse_args()

src_list = []
with open(cmd_args.list, 'r') as f:
  for line in f:
    src_list.append(line.strip())

list_len = len(src_list)
proc_num = multiprocessing.cpu_count()
files_per_job = list_len // proc_num

def job(job_index):
  try:
    begin_ind = files_per_job * job_index
    end_ind = files_per_job * (job_index + 1)
    last_job = (job_index == proc_num - 1)
    if last_job:
      end_ind = list_len
    for i in range(begin_ind, end_ind):
      filename = src_list[i]
      link_from = os.path.join(cmd_args.cellar, filename)
      link_to = os.path.join(cmd_args.dest, filename)
      os.link(link_from, link_to)
    return 0
  except Exception as exc:
    print('Exception caught: {}'.format(exc))
    return 1

def run_link():
  pool = multiprocessing.Pool(processes=proc_num)
  result = pool.map(job, range(proc_num))
  pool.close()
  pool.join()

  if 1 in result:
    sys.exit('Some job failed')

if __name__ == '__main__':
  run_link()
