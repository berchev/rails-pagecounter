#!/usr/bin/env bash

# install docker if not installed
which docker || {
  apt-get update
  apt-get install -y docker.io

  # Make Vagrant user part of the docker group
  usermod -aG docker vagrant 
}
