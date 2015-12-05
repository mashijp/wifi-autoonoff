#!/bin/bash

while :
do
  sleep 0.3
  status=$(curl --max-time 1 -o /dev/null -w '%{http_code}' -s  http://www.yahoo.co.jp/)
  if [ $status -eq 200 ]; then
    echo -n "."
  else
    echo "NG $status"
    echo 'display notification "Wi-Fi Auto Turn Off"' | osascript
    echo "$(date) Wi-Fi: Turning OFF....."
    networksetup -setairportpower Wi-Fi off
    sleep 1
    echo "$(date) Wi-Fi: Turning ON......"
    networksetup -setairportpower Wi-Fi on
    sleep 10
  fi
done

