#!/bin/bash

# before all
sudo apt-get update;

# tools install;
sudo apt-get install git;
sudo apt-get install vim;
sudo apt-get install make;

# git init
git config --global user.email idbolshakov@gmail.com;
git config --global core.editor vim;

# vim init
cd /tmp && git clone https://github.com/idbolshakov/vimrc;
cd /tmp/vimrc && make init;

# docker
sudo apt-get update;
sudo apt-get install \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common;
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable";
sudo apt-get update;
sudo apt-get install docker-ce;

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" \
  -o /tmp/docker-compose;
chmod +x /tmp/docker-compose;
mv /tmp/docker-compose /usr/local/bin/docker-compose;

# add locales
echo "export LC_CTYPE=en_US.UTF-8" >> ~/.bashrc;
echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc;
source ~/.bashrc;
