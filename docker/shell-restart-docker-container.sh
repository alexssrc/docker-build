#!/bin/bash

# 提示:
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# Warning:
# Do not execute this script directly
# Do not execute this script directly
# Do not execute this script directly

echo ""
echo "==> container-port : ${1}"
echo "==> container-name : ${2}"
echo "==> images-name    : ${3}"
echo "==> images-tag     : ${4}"
echo ""

sleep 1

# The port cannot be empty
echo -e "\033[34mStop a container .......................\033[0m"
if [ -z "${1}" ]; then
  echo -e "\033[31m==> [ERROR]: The port cannot be empty!\033[0m"
  exit 1
fi

# The container name cannot be empty
if [ -z "${2}" ]; then
  echo -e "\033[31m==> [ERROR]: The container cannot be empty!\033[0m"
  exit 1
fi

# The images name cannot be empty
if [ -z "${3}" ]; then
  echo -e "\033[31m==> [ERROR]: The images cannot be empty!\033[0m"
  exit 1
fi

echo -e "\033[34m容器：${2}\033[0m"

# Stop container
source shell-stop-docker-container.sh "${2}"

sleep 1

echo -e "\033[34mStart a container ......................\033[0m"
echo -e "\033[34m镜像：${3}\033[0m"
echo -e "\033[34m容器：${2}\033[0m"
echo -e "\033[34m端口：${1}\033[0m"

tag="${4}"
if [ -z "${tag}" ]; then
  tag="latest"
fi

echo -e "\033[34m标签：${tag}\033[0m"

# Start container
if ! source shell-start-docker-container.sh "${1}" "${2}" "${3}" "${tag}"; then
  echo -e "\033[31m==> [ERROR]: Container [${2}] failed to start!\033[0m"
  exit 1
fi

sleep 1

echo -e "\033[32mSTART SUCCESS\033[0m"
echo -e "\033[32mEXECUTE FINISHED!\033[0m"