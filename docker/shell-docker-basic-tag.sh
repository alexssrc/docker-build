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
ORIGIN_TAG="${4}" # IMAGES ORIGIN TAG
TARGET_TAG="${5}" # IMAGES TARGET TAG

echo ""
echo "==> DOCKER-HUB    : ${HUB}"
echo "==> DOCKER-REPO   : ${REPO}"
echo "==> IMAGES-NAME   : ${NAME}"
echo "==> ORIGIN_TAG    : ${ORIGIN_TAG}"
echo "==> TARGET_TAG    : ${TARGET_TAG}"
echo ""

sleep 1

FULL_IMAGES_NAME=""

if [ -z "${NAME}" ]; then
  echo -e "\033[31m==> [ERROR]: Images name cannot be empty!\033[0m"
  exit 1
fi

# default origin tag: latest
if [ -z "${ORIGIN_TAG}" ]; then
  ORIGIN_TAG="latest"
  echo -e "\033[33m==> [WARN]: Default origin tag latest!\033[0m"
fi

# default repository: library
if [ -z "${REPO}" ]; then
  REPO="library"
  echo -e "\033[33m==> [WARN]: Default repository library!\033[0m"
fi

if [ "${HUB}" ]; then
  FULL_IMAGES_NAME="${HUB}/${REPO}/${NAME}"
else
  FULL_IMAGES_NAME="${NAME}"
fi

echo -e "\033[34mFULL_IMAGES_NAME: ${FULL_IMAGES_NAME}\033[0m"

ORIGIN_IMAGES_ID=$(docker images -q "${FULL_IMAGES_NAME}:${ORIGIN_TAG}")

# Origin tag does not exist
if [ -z "${ORIGIN_IMAGES_ID}" ]; then
  echo -e "\033[31m==> [ERROR]: Origin tag does not exist!\033[0m"
  echo -e "\033[31m镜像: ${FULL_IMAGES_NAME}\033[0m"
  echo -e "\033[31m标签: ${ORIGIN_TAG}\033[0m"
  exit 1
fi

# default target tag: ORIGIN_IMAGES_ID
if [ -z "${TARGET_TAG}" ]; then
  TARGET_TAG="${ORIGIN_IMAGES_ID}"
fi

TARGET_IMAGES_ID=$(docker images -q "${FULL_IMAGES_NAME}:${TARGET_TAG}")

# Target tag already exist
if [ ! -z "${TARGET_IMAGES_ID}" ]; then
  echo -e "\033[33m==> [WARN]: Target tag already exist!\033[0m"
  echo -e "\033[33m镜像: ${FULL_IMAGES_NAME}\033[0m"
  echo -e "\033[33m标签: ${TARGET_TAG}\033[0m"
  exit 1
fi

docker tag "${FULL_IMAGES_NAME}:${ORIGIN_TAG}" "${FULL_IMAGES_NAME}:${TARGET_TAG}"

echo -e "\033[32m==> [INFO]: Images tag success.\033[0m"
echo -e "\033[34m镜像名: ${FULL_IMAGES_NAME}\033[0m"
echo -e "\033[34m原标签: ${ORIGIN_TAG}\033[0m"
echo -e "\033[34m新标签: ${TARGET_TAG}\033[0m"
