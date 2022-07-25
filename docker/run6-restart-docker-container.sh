#!/bin/bash

# 可运行
# Executable

# Tips: Restart a container

source shell-var.sh

PORT="${P7}"  # PORT
NAME="${P3}"  # PROJECT，images name
TAG="${P5}"   # TAG

# ${0}_restart.sh，${1}_port/端口，${2}_container/容器，${3}_images/镜像，${4}_tag/标签
source shell-restart-docker-container.sh "${PORT}" "${NAME}" "${NAME}" "${TAG}"