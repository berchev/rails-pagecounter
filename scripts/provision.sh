#!/usr/bin/env bash

# Debug mode enabled
set -x

# install redis
which redis-server redis-cli || {
  apt-get update
  apt-get install -y redis-server redis-tools
}

# Deploy Redis configuration 
PASSWORD=georgiman

grep -Fxq ${PASSWORD} /etc/redis/redis.conf || {
  cp /etc/redis/redis.conf /etc/redis/redis.conf.back
  cp /vagrant/conf/redis.conf /etc/redis/redis.conf
  systemctl restart redis-server
}
