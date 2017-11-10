#!/bin/bash
set -e -x
virtualenv -p python3 --no-setuptools --no-pip .
bin/python <(curl https://bootstrap.pypa.io/get-pip.py) --upgrade setuptools==36.6.0 pip zc.buildout
printf "[buildout]\n\nextends = buildout/base-produto.cfg" >> buildout.cfg
bin/buildout

