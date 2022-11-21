#!/bin/bash

# 提示:
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# Warning:
# Do not execute this script directly
# Do not execute this script directly
# Do not execute this script directly

HUB="${1}"        # HUB URL
REPO="${2}"       # HUB REPOSITORY
NAME="${3}"       # IMAGES NAME
TAG="${4}"        # IMAGES TAG
PLATFORM="${5}"   # PLATFORM
DOCKERFILE="${6}" # DOCKERFILE

echo ""
echo "=====>> DOCKER-HUB    : ${HUB}"
echo "=====>> DOCKER-REPO   : ${REPO}"
echo "=====>> IMAGES-NAME   : ${NAME}"
echo "=====>> IMAGES-TAG    : ${TAG}"
echo "=====>> PLATFORM      : ${PLATFORM}"
echo "=====>> DOCKERFILE    : ${DOCKERFILE}"
echo ""

sleep 1

echo "Maven build start"
export JAVA_HOME=$JDK17
# Maven package
if ! mvn clean package -U -e -q -Dmaven.test.skip=true; then
  echo -e "\033[31m==> [ERROR]: MAVEN BUILD FAILURE\033[0m"
  exit 1
fi

echo -e "\033[32m==> [INFO]: MAVEN BUILD SUCCESS\033[0m"

sleep 1

# Docker build
if ! docker buildx build --platform "${PLATFORM}" -f "${DOCKERFILE}" -t "${HUB}/${REPO}/${NAME}:${TAG}" --load .; then
  echo -e "\033[31m==> [ERROR]: DOCKER BUILD FAILURE\033[0m"
  exit 1
fi

echo -e "\033[32m==> [INFO]: DOCKER EXECUTION COMPLETE，PLATFORM=${PLATFORM}\033[0m"

if [ "${PLATFORM}" == "linux/amd64" ]; then
  echo -e "\033[34m==> [INFO]: PUSH EXECUTE:\033[0m"
  echo -e "\033[32mdocker push ${HUB}/${REPO}/${NAME}:${TAG}\033[0m"
fi
