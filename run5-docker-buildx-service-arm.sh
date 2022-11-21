#!/bin/bash

# 可运行
# Executable

# Tips: Build images for linux/arm64

source shell-variable.sh

HUB_URL="${VAR_HUB}"                # HUB URL
HUB_REPO="${VAR_REPO}"              # HUB REPOSITORY
IMAGES="${VAR_IMAGES_NAME}"         # IMAGES NAME
TAG="${VAR_DEFAULT_TAG}"            # IMAGES TAG
PLATFORM="${VAR_PLATFORM_ARM}"      # PLATFORM
DOCKERFILE="${VAR_DOCKERFILE_ARM}"  # DOCKER FILE PATH

source shell-docker-build-basic.sh "${HUB_URL}" "${HUB_REPO}" "${IMAGES}" "${TAG}" "${PLATFORM}" "${DOCKERFILE}"