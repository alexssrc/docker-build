#! /bin/bash

# 可运行
# Executable

# Tips: docker create buildX

docker buildx create --name multi-platform --use \
--platform linux/amd64,linux/arm64 \
--driver docker-container