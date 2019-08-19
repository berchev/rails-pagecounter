#!/usr/bin/env bash

# Debug mode enabled
#set -x

# Test if builded container is running
if [ "$(docker ps | grep berchev | awk {'print $2'})" = "berchev/counter:latest" ]; then
   echo "Test Pass! Docker image has been builded correctly!"
else
   echo "Test Failed! Docker image was not builded correctly!"
   exit 1
fi

# Make sure container has been started before running the second test

retry=5
i=0
while [ ${i} -lt ${retry} ]; do
       curl -sL http://localhost:3000 > /dev/null 2>&1
       [ $? -eq 0 ] && break
       let i++
       sleep 5
done


unset retry
unset i

# Test if Rails website is accessible
if [ "$(curl -s localhost:3000 | grep "Boys don't cry!" | cut -d'>' -f2- | cut -d'<' -f1)" = "Boys don't cry!" ]; then
  echo "Test Pass! Website is accessible!"
else
  echo "Test Failed! Website is not accessible!"
  exit 1
fi
