#!/bin/bash

# 可运行
# Executable

# Tips: docker build

source shell-var.sh

NAME="${P3}"  # PROJECT，images name
TAG="${P5}"   # images tag

cd "${PATH_DIR}"

docker build -t "${NAME}:${TAG}" .