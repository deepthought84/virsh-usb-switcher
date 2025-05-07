#!/bin/bash
vm=$1

devices="headset bluetooth mouse keyboard audio" 

function display_connected () {
	xrandr |grep " connected" > /dev/null
}

function attach () {
	for token in $2; do
		virsh attach-device $1 ${token}.xml
	done
}

function detach () {
        for token in $2; do
                virsh detach-device $1 ${token}.xml
        done
}

disp_is_connected_last=0
while true
do
  sleep 1
  disp_is_connected_last="$disp_is_connected"
  display_connected && disp_is_connected=1 || disp_is_connected=0
  if [ "$disp_is_connected" != "$disp_is_connected_last" ]
  then
    echo "state changed"
    if [ "$disp_is_connected" == "1" ]
    then 
      detach "$vm" "$devices"
    else
      attach "$vm" "$devices"
    fi 
  fi
done
