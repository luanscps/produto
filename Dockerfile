FROM ubuntu:16.04
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
MAINTAINER KMEE <dev@kmee.com.br>
ENV ODOO_VERSION 11.0
#
# Copia todos os aquivos necessários
#
COPY ["deploy/", "./"]
#########################################################
# 1- Instala as dependencias
# 2- Cria o usuario Odoo e suas configurações
#########################################################
RUN sh install-dependencies.sh
# Cria o usuario odoo e as configuraçoes do bashrc
RUN sh create-odoo-user.sh
# Instala o Buildout
WORKDIR /opt/odoo/
USER odoo

##########################################################
#
#  3. Executa um buildot com os principais eggs 
# para realizar cache e agilizar o processo em outras camadas.
#
##########################################################

RUN mkdir -p .buildout
COPY ["buildout/default.cfg", ".buildout/default.cfg"]
#
RUN mkdir -p /tmp/workspace
COPY ["buildout/", "/tmp/workspace/"]
RUN ls -lah /tmp/workspace
WORKDIR /tmp/workspace/
RUN sh create-virtualenv.sh
RUN ./bin/buildout -c cache.cfg
#
# Clean tmp folder!
#
WORKDIR /opt/odoo
RUN rm -rf /tmp/workspace/

##########################################################
#
#  4. Executa um buildot do produto
#
##########################################################

COPY ["buildout/", "/opt/odoo"]

RUN sh create-virtualenv.sh
USER root
RUN ./bin/buildout -c mileo.cfg
