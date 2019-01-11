#!/usr/local/bin/python

"""This is a simple script that infinitely makes a requests to a given endpoint serially"""

import argparse
import requests

def request(endpoint):
    resp = requests.get(endpoint)
    print("Got {} from {}".format(resp.status_code, endpoint))

def main(endpoint):
    while(True):
        request(endpoint)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("endpoint")
    args = parser.parse_args()
    main(args.endpoint)