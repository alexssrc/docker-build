#!/bin/bash

# 提示:
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# Warning:
# Do not execute this script directly
# Do not execute this script directly
# Do not execute this script directly

# 每个项目都需要修改的部分
# Images name
VAR_IMAGES_NAME="images-name"
# Container name
VAR_CONTAINER_NAME="container-name"
# Project run port
VAR_PORT="8080:8080"


# Docker hub url
VAR_HUB="hub.docker.com"
# Docker repository，Default：library
VAR_REPO="library"
VAR_RUN_IMAGES_NAME="${VAR_HUB}/${VAR_REPO}/${VAR_IMAGES_NAME}"
VAR_DEFAULT_TAG="latest"
# images tag，Default：latest
VAR_ORIGIN_TAG="latest"
# Docker new tag
VAR_NEW_TAG="latest"
# Docker platform
VAR_PLATFORM_ARM="linux/arm64"
VAR_PLATFORM_AMD="linux/amd64"
# Docker file path
VAR_DOCKERFILE_ARM="docker-arm/Dockerfile"
VAR_DOCKERFILE_AMD="docker-amd/Dockerfile"
VAR_DOCKERFILE_AUTO="docker-auto/Dockerfile"
# notwork name
VAR_NETWORK_NAME=custom-network
# Docker login username
VAR_DOCKER_ADMIN="admin"
# Docker login password
VAR_DOCKER_PASS="H12345"
