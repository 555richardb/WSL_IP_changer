#!/bin/bash
CURRENT_IP=$( ip a | grep -E "inet.*eth0" | awk '{ print substr( $2, 1, length($2)-3 ) }')
OLD_IP=$(sudo cat /mnt/c/Windows/System32/drivers/etc/hosts | grep HOSTNAME_TO_LOOK_FOR |awk '{ print($1)  }')
if [ $CURRENT_IP != $OLD_IP ]; then
   sudo sed -i  "s|${OLD_IP}|${CURRENT_IP}|"  /mnt/c/Windows/System32/drivers/etc/hosts
   echo "Updated"
else
   echo $CURRENT_IP "vs "$OLD_IP 
fi
