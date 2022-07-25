#!/bin/bash

# 可运行
# Executable

# Tips: Push a container to hub

source shell-var.sh

HUB="${P1}"   # HUB URL
REPO="${P2}"  # HUB REPOSITORY
USER="${P8}"  # Login username
PASS="${P9}"  # Login password
NAME="${P3}"  # IMAGES NAME
TAG="${P5}"   # IMAGES TAG

source shell-docker-basic-push.sh "$HUB" "$USER" "$PASS" "$REPO" "$NAME" "$TAG"