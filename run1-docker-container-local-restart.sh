#!/bin/bash

# 可运行
# Executable

# Tips: Restart a container

source shell-variable.sh

PORT="${VAR_PORT}"                 # PORT
IMAGES="${VAR_RUN_IMAGES_NAME}"    # PROJECT，images name
CONTAINER="${VAR_CONTAINER_NAME}"  # PROJECT，container name
TAG="${VAR_DEFAULT_TAG}"           # TAG

# ${0}_restart.sh，${1}_port/端口，${2}_container/容器，${3}_images/镜像，${4}_tag/标签
source shell-docker-container-restart.sh "${PORT}" "${CONTAINER}" "${IMAGES}" "${TAG}"