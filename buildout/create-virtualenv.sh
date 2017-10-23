#!/bin/bash
set -e
virtualenv . --python=python3
./bin/pip install -U pip zc.buildout==2.8.0
