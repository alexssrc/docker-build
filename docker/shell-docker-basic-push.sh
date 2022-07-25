#!/bin/bash

# 提示:
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# 不要直接执行这个脚本
# Warning:
# Do not execute this script directly
# Do not execute this script directly
# Do not execute this script directly

HUB="${1}"  # HUB URL
USER="${2}" # Login username
PASS="${3}" # Login password
REPO="${4}" # HUB REPOSITORY
NAME="${5}" # IMAGES NAME
TAG="${6}"  # IMAGES TAG

echo ""
echo "==> DOCKER-HUB    : ${HUB}"
echo "==> DOCKER-USER   : ${USER}"
echo "==> DOCKER-REPO   : ${REPO}"
echo "==> IMAGES-NAME   : ${NAME}"
echo "==> IMAGES-TAG    : ${TAG}"
echo ""

sleep 1

# HUB URL cannot be empty
if [ -z "${HUB}" ]; then
  echo -e "\033[31m==> [ERROR]: DOCKER HUB URL cannot be empty!\033[0m"
  exit 1
fi

# Docker username cannot be empty
if [ -z "${USER}" ]; then
  echo -e "\033[31m==> [ERROR]: DOCKER USERNAME cannot be empty!\033[0m"
  exit 1
fi

# Docker password cannot be empty
if [ -z "${PASS}" ]; then
  echo -e "\033[31m==> [ERROR]: DOCKER PASSWORD cannot be empty!\033[0m"
  exit 1
fi

# HUB REPOSITORY cannot be empty
if [ -z "${REPO}" ]; then
  echo -e "\033[31m==> [ERROR]: HUB REPOSITORY cannot be empty!\033[0m"
    exit 1
fi

# Images name cannot be empty
if [ -z "${NAME}" ]; then
  echo -e "\033[31m==> [ERROR]: Images name cannot be empty!\033[0m"
  exit 1
fi

# Images tag cannot be empty
if [ -z "${TAG}" ]; then
  echo -e "\033[31m==> [ERROR]: Images name cannot be empty!\033[0m"
    exit 1
fi

# Docker Login to HUB
if ! docker login -u "${USER}" -p "${PASS}" "${HUB}" >/dev/null 2>&1; then
  echo -e "\033[31m==> [ERROR]: Docker login Failed，HUB=${HUB}\033[0m"
  exit 1
fi

echo -e "\033[32m==> [INFO]: Docker login Success，HUB=${HUB}\033[0m"

# images full name
FULL_IMAGES_NAME="${HUB}/${REPO}/${NAME}"

IMAGE_ID=$(docker images | grep "${FULL_IMAGES_NAME}" | grep "${TAG}" | grep -v grep | awk '{print $3}')

# No images found
if [ -z "${IMAGE_ID}" ]; then
  echo -e "\033[31m==> [ERROR]: No images found!\033[0m [IMAGES]: ${FULL_IMAGES_NAME}  [TAG]: ${TAG}"
  exit 1
fi

if ! docker push "${FULL_IMAGES_NAME}:${TAG}"; then
  echo -e "\033[31m==> [ERROR]: Images push Failed，[IMAGES]: ${FULL_IMAGES_NAME}  [TAG]: ${TAG}\033[0m"
  exit 1
fi

echo -e "\033[32m==> [INFO]: Images push Success，[IMAGES]: ${FULL_IMAGES_NAME}  [TAG]: ${TAG}\033[0m"