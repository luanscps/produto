#!/bin/bash
set -e
pwd
ls -lah
wget https://raw.github.com/buildout/buildout/master/bootstrap/bootstrap.py
python bootstrap.py
