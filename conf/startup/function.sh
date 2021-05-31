#!/bin/bash

_STDOUT="/dev/stdout"
_STDERR="/dev/stderr"

RED='\033[0;31m'
BLACK='\033[0;30m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
L_GRAY='\033[0;37m'

L_BLUE='\033[1;34m'

NC='\033[0m'

function print_d() {

  echo -e "${GREEN} $1 ${NC}" > ${_STDOUT}
}

function print_i() {
  echo -e "${CYAN} $1 ${NC}" > ${_STDOUT}
}

function print_e() {
  _TIME=`date '+%Y/%m/%d %H:%M:%S %Z%z'`
  echo -e -n "${L_BLUE} $_TIME ${NC}" > ${_STDERR}
  echo -e "${RED} $1 ${NC}" > ${_STDERR}
}

function func_prepare() {
  if [ -e "/etc/nginx/conf.d" ]; then
    cd /etc/nginx/conf.d/
    find . ! -name default.conf -type f -exec rm {} + 
    cp /opt/nginx/* /etc/nginx/conf.d/
  else
    print_e "please make sure already install nginx service in this system"
  fi

  if [ -e "/etc/supervisor/conf.d" ]; then
    cd /etc/supervisor/conf.d
    find . -type f -name *.conf -exec rm {} +
  else
    print_e "please make sure already install supervisor daemon in this system"
  fi

  print_i "prepare tasks finish ..."
}

function func_start() {
  
  print_d "no nodaemon and no be managered task ..."
  #nohup gom3u8 3>&1 2>&1 | ts '%Y-%m-%dT%H:%M:%S ' &
}
