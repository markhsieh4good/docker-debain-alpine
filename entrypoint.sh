#!/bin/bash

echo -n "===== start bash == "
date "+%Y/%m/%d %H:%M:%S %Z%z"
echo ""

. /opt/startup/function.sh

echo -n "===== command steps == "
date "+%Y/%m/%d %H:%M:%S %Z%z"
echo ""

if [ -e "/etc/nginx/sites-enabled/default" ]; then
  rm /etc/nginx/sites-enabled/default
fi

if [ -e '/etc/nginx/conf.d/default.conf' ]; then
  echo "use nginx defalut.conf"
fi

echo -n "===== manual steps == "
date "+%Y/%m/%d %H:%M:%S %Z%z"
echo ""

func_prepare
func_start

echo -n "===== start up daemon == "
date "+%Y/%m/%d %H:%M:%S %Z%z"
echo ""

echo "supervisord ... "
sleep 1
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
