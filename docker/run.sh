#!/bin/bash

# 可运行
# Executable

echo ""
echo -e "\033[32mWelcome use SSRC docker build!\033[0m"
echo ""
echo -e "\033[34m[1]:\033[0m Maven build to jar."
echo -e "\033[34m[2]:\033[0m Docker build to images."
echo -e "\033[34m[3]:\033[0m Docker buildX build to images."
echo -e "\033[34m[4]:\033[0m Docker tag for default."
echo -e "\033[34m[5]:\033[0m Push current container to hub."
echo -e "\033[34m[6]:\033[0m Restart current container."
echo -e "\033[34m[7]:\033[0m Stop current container."
echo -e "\033[34m[8]:\033[0m Delete images with tag none."
echo -e "\033[34m[9]:\033[0m Docker create buildX."
echo -e "\033[34m[0]:\033[0m Exit."
echo ""
echo -e "\033[32m请输入[0-9]：\033[0m\c"

IFS= read -r num

case "${num}" in
1)
  source run1-build-jar.sh
  ;;
2)
  source run2-build-docker-images.sh
  ;;
3)
  source run3-buildx-docker-images.sh
  ;;
4)
  source run4-docker-images-tag.sh
  ;;
5)
  source run5-docker-images-push.sh
  ;;
6)
  source run6-restart-docker-container.sh
  ;;
7)
  source run7-stop-docker-container.sh
  ;;
8)
  source run8-remove-none-images.sh
  ;;
9)
  source run9-buildx-docker-create.sh
  ;;
0)
  echo "Bye!"
  ;;
*)
  echo "Invalid input Bye!"
  ;;
esac
