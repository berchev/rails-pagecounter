#!/usr/bin/env bash
# Debug mode enabled
set -x

# Test if builded container is running
if [ "$(docker ps | grep berchev | awk {'print $2'})" = "berchev/counter:latest" ]; then
   echo "Test Pass! Docker image has been builded correctly!"
else
   echo "Test Failed! Docker image was not builded correctly!"
   exit 1
fi

# Using sleep because Counter Container is not completely started during the second test
sleep 25

# Test if Rails website is accessible
if [ "$(curl -s localhost:3000 | grep "Boys don't cry!" | cut -d'>' -f2- | cut -d'<' -f1)" = "Boys don't cry!" ]; then
  echo "Test Pass! Website is accessible!"
else
  echo "Test Failed! Website is not accessible!"
  exit 1
fi
