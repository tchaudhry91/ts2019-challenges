#!/usr/bin/env python

import requests
from time import sleep

url='http://server.default:8282'
headers = {'Hello': 'world'}

while True:
    try:
        r = requests.get(url, headers=headers, timeout=1)
        print(r.status_code)
    except requests.exceptions.RequestException as e:
        print(e)
    sleep(1)
