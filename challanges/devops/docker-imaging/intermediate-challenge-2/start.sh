#!/bin/bash
docker rmi hello-worlds-python:slim 2> /dev/null
cd python-hello-worlds && docker build -t python-hello-worlds .