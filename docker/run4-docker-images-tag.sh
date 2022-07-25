#!/bin/bash

# 可运行
# Executable

# Tips: Default use images-id to generate tags for the current docker images

source shell-var.sh

HUB="${P1}"     # HUB URL，hub.docker.com
REPO="${P2}"    # REPOSITORY，library
NAME="${P3}"    # PROJECT，images name
ORIGIN="${P5}"  # ORIGIN TAG
TARGET="${P6}"  # TARGET TAG

source shell-docker-basic-tag.sh "${HUB}" "${REPO}" "${NAME}" "${ORIGIN}" "${TARGET}"