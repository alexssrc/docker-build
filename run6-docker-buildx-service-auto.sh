#!/bin/bash

# 可运行
# Executable

# Tips: Build images for linux/arm64

source shell-variable.sh

HUB_URL="${VAR_HUB}"                # HUB URL
HUB_REPO="${VAR_REPO}"              # HUB REPOSITORY
IMAGES="${VAR_IMAGES_NAME}"         # IMAGES NAME
TAG="${VAR_DEFAULT_TAG}"            # IMAGES TAG
DOCKERFILE="${VAR_DOCKERFILE_AUTO}" # DOCKER FILE PATH

if [[ $(uname) == 'Darwin' ]]; then
  if [[ $(uname -m) == 'arm64' ]]; then
    PLATFORM="${VAR_PLATFORM_ARM}"
  fi
  if [[ $(uname -m) == 'x86_64' ]]; then
    PLATFORM="${VAR_PLATFORM_AMD}"
  fi
fi

if [[ $(uname) == 'Linux' ]]; then
  PLATFORM="${VAR_PLATFORM_AMD}"
fi

source shell-docker-build-basic.sh "${HUB_URL}" "${HUB_REPO}" "${IMAGES}" "${TAG}" "${PLATFORM}" "${DOCKERFILE}"
