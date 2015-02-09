#!/bin/bash
set -xeo pipefail

echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list
wget --no-check-certificate --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

apt-get update
apt-get dist-upgrade -y
apt-get install -y \
  build-essential \
  curl \
  git \
  memcached \
  nodejs \
  phantomjs\
  postgresql-9.3 \
  postgresql-contrib-9.3 \
  libpq-dev \
  libxml2-dev \
  libxslt1-dev \
  redis-server \
  vim-tiny \
  #

# make the vagrant user a postgres admin
sudo -i -u postgres psql postgres <<EOF
CREATE ROLE vagrant WITH SUPERUSER LOGIN
EOF
