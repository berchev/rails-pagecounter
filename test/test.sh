#!/usr/bin/env bash

# Test if builded container is running
if [ "$(docker ps | grep berchev | awk {'print $2'})" = "berchev/counter:0.0.2" ]; then
   echo "Test Pass! Docker image has been builded correctly!"
else
   echo "Test Failed! Docker image was not builded correctly!"
   exit 1
fi

# Test if Rails website is accessible
if [ "$(curl localhost:3000 | grep "Boys don't cry!" | cut -d'>' -f2- | cut -d'<' -f1)" = "Boys don't cry!" ]; then
  echo "Test Pass! Website is accessible!"
else
  echo "Test Failed! Website is not accessible!"
  exit 1
fi
