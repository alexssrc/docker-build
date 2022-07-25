#!/bin/bash

# 可运行
# Executable

# Tips: Delete images with tag none

IMAGES_ID=$(docker images | grep '\<none\>' | grep -v grep | awk '{print $3}' | tr '\n' ' ')
IFS=' ' read -r -a array <<<"${IMAGES_ID}"
for item in ${array[*]}; do
  if [ ! -z "${item}" ]; then
    docker rmi "${item}"
  fi
done

echo -e "\033[32m==> [INFO]: remove none images finished!\033[0m"
