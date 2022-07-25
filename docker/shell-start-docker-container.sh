#!/bin/bash

# 提示:
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# Warning:
# Do not execute this script directly
# Do not execute this script directly
# Do not execute this script directly

# images does it exist
if [ -z "$(docker images -q ${3}:${4})" ]; then
  echo -e "\033[31m==> [ERROR]: Images does not exist!\033[0m"
  echo -e "\033[31m镜像: ${3}\033[0m"
  echo -e "\033[31m标签: ${4}\033[0m"
  exit 1
fi

# Container Start ...
# ${1} 端口   ${2} 容器   ${3} 镜像
docker run -d -p "${1}" --name "${2}" "${3}:${4}" >/dev/null 2>&1
