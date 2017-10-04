#!/bin/bash

ORG="kmee"

sudo apt install python3-dev
virtualenv . --python=python3
mkdir -p parts
cd parts
git clone git@github.com:$ORG/ocb.git --branch=11.0 odoo
git clone git@github.com:$ORG/l10n-brazil.git --branch=11.0 l10n-brazil
git clone git@github.com:$ORG/reporting-engine.git --branch=11.0 reporting-engine
#
cd ..
#
mkdir -p src
cd src
git clone git@github.com:kmee/pybrasil.git --branch=python3 pybrasil
#
cd ..
source bin/activate
# Pode ser que vc precise alterar o arquivo com a versão lxml==4.0
pip install -r parts/odoo/requirements.txt
pip install -r requirements.txt
