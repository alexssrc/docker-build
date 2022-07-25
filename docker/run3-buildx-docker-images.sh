#!/bin/bash

# 可运行
# Executable

# Tips: docker buildX build

source shell-var.sh

HUB="${P1}"   # HUB URL，hub.docker.com
REPO="${P2}"  # REPOSITORY，library
NAME="${P3}"  # PROJECT，images name
TAG="${P5}"   # TAG

source shell-docker-basic-build.sh "${HUB}" "${REPO}" "${NAME}" "${TAG}"