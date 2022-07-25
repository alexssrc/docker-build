#!/bin/bash

# 提示:
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# Warning:
# Do not execute this script directly
# Do not execute this script directly
# Do not execute this script directly

source shell-var.sh

HUB="${1}"  # HUB URL
REPO="${2}" # HUB REPOSITORY
NAME="${3}" # IMAGES NAME
TAG="${4}"  # IMAGES TAG
PLATFORM=linux/amd64

echo ""
echo "==> DOCKER-HUB    : ${HUB}"
echo "==> DOCKER-REPO   : ${REPO}"
echo "==> IMAGES-NAME   : ${NAME}"
echo "==> IMAGES-TAG    : ${TAG}"
echo ""

sleep 1

cd "${PATH_DIR}"

# Maven package
if ! mvn clean package -Dmaven.test.skip=true; then
  echo -e "\033[31m==> [ERROR]: MAVEN BUILD FAILED\033[0m"
  exit 1
fi

echo -e "\033[32m==> [INFO]: MAVEN BUILD SUCCESS\033[0m"

sleep 1

# Docker build
if ! docker buildx build --platform "${PLATFORM}" -t "${HUB}/${REPO}/${NAME}:${TAG}" --load .; then
  echo -e "\033[31m==> [ERROR]: DOCKER BUILD FAILED\033[0m"
  exit 1
fi

echo -e "\033[32m==> [INFO]: DOCKER SUCCESS，platform=${PLATFORM}\033[0m"
echo -e "\033[32m==> [INFO]: PUSH EXEC: docker push ${HUB}/${REPO}/${NAME}:${TAG}\033[0m"
