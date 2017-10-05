#!/usr/bin/env bash
set -e -x
virtualenv -p python3 .
bin/pip install -U zc.buildout==2.8.0 pip
bin/buildout

