#!/bin/bash

# 可运行
# Executable

# Tips: maven build

source shell-var.sh

cd "${PATH_DIR}"

mvn clean package -Dmaven.test.skip=true