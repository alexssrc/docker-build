#!/bin/bash

# 提示:
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# Warning:
# Do not execute this script directly
# Do not execute this script directly
# Do not execute this script directly

# container not exist
CONTAINER_ID=$(docker ps -qa --filter "name=${1}")
if [ -z "${CONTAINER_ID}" ]; then
  echo -e "\033[33m==> [WARN]: Container [${1}] does not exist!\033[0m"
fi

# container exist
if [ ! -z "${CONTAINER_ID}" ]; then
  # container does it running
  RUNNING=$(docker ps -q --filter "name=${1}")
  if [ -z "${RUNNING}" ]; then
    echo -e "\033[33m==> [WARN]: Container [${1}] no running!\033[0m"
  fi
fi

# stop and remove container
if [ ! -z "${CONTAINER_ID}" ]; then
  echo -e "\033[36m==> [INFO]: Stop and remove container\033[0m"
  echo -e "\033[36m==> [INFO]: Container ID：${CONTAINER_ID}\033[0m"
  # stop container ...
  docker stop "${CONTAINER_ID}" >/dev/null 2>&1
  # remove container ...
  docker rm -f "${CONTAINER_ID}" >/dev/null 2>&1
  echo -e "\033[32mSTOP SUCCESS\033[0m"
fi
