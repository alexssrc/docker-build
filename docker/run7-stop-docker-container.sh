#!/bin/bash

# 可运行
# Executable

# Tips: Stop a container

source shell-var.sh

CONTAINER="${P4}"  # container name

echo -e "\033[34mStop a container .......................\033[0m"
echo -e "\033[34m容器：${CONTAINER}\033[0m"

source shell-stop-docker-container.sh "${CONTAINER}"