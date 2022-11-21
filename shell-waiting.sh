#! /bin/bash

trap 'onCtrlC' INT
function onCtrlC() {
  kill $(jobs -p) >/dev/null 2>&1
  kill $pid >/dev/null 2>&1
  exit 1
}

pid=
timeout=60
function waiting() {
  i=0
  while [ $i -le $timeout ]; do
    echo -n -e "\033[5m-\033[0m\b"
    sleep 0.25
    echo -n -e "\033[5m/\033[0m\b"
    sleep 0.25
    echo -n -e "\033[5m|\033[0m\b"
    sleep 0.25
    echo -n -e "\033[5m\\\\\033[0m\b"
    sleep 0.25
    let i=i+1
  done
}
