#!/usr/bin/env bash

# Test if docker image has builded correctly 
if [ "$(docker images -q berchev/counter:latest)" ]; then
   echo "Test Pass! Docker image has been builded correctly!"
else
   echo "Test Failed! Docker image was not builded correctly!"
   exit 1
fi

# Make sure container has been started before running test
retry=5
i=0
while [ ${i} -lt ${retry} ]; do
       curl -sL http://localhost:3000 &>/dev/null 
       [ $? -eq 0 ] && break
       let i++
       sleep 5
done

unset retry
unset i

# Test if Rails website is accessible
curl -s localhost:3000 | grep "Boys don't cry!" &>/dev/null

if [ $? -eq 0 ]; then
  echo "Test Pass! Website is accessible!"
else
  echo "Test Failed! Website is not accessible!"
  exit 1
fi
