#!/usr/bin/python

import os, re

path = os.path.join("/proc/" + str(os.getpid()) + "/cgroup")

def is_docker():
  if not os.path.isfile(path): return False
  with open(path) as f:
    for line in f:
      if re.match("\d+:[\w=]+:/docker(-[ce]e)?/\w+", line):
        return True
    return False

if __name__ == "__main__":
    print("Hello Wrlds!! from {}!".format(os.getpid()))
    print("Running in Docker: {}".format(is_docker()))
