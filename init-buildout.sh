#!/bin/bash
set -e -x
virtualenv -p python3 --no-setuptools --no-pip .
bin/python <(curl https://bootstrap.pypa.io/get-pip.py) --upgrade setuptools==33.1.1 pip zc.buildout

