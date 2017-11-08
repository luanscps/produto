#!/bin/bash
set -e -x
virtualenv -p python3 --no-setuptools --no-pip .
bin/python <(curl https://bootstrap.pypa.io/get-pip.py) --upgrade setuptools pip zc.buildout
echo "[buildout]\n\nextends = buildout/base-produto.cfg" >> buildout.cfg
bin/buildout

