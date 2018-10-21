#!/bin/bash
#Log location
LOG="/tmp/inactive_users.log"
# Emty log file
> $LOG
#Get list of wheel users and prep for grep
ignore_wheel=$(/usr/sbin/groupmems -g wheel -l | /bin/sed -e "s/  /\\\|/g")
# Check if user locked or list of wheel
for U in $(/bin/awk -F: '{ system("passwd -S " $1)}' /etc/passwd | /bin/grep " PS " | /bin/grep -v "$ignore_wheel" | /bin/grep -v 'root'| /bin/awk '{print $1}')
do
/usr/bin/lastlog -b 90 -u $U| /bin/awk '{print $1,": Last login:",$5,$6,$9 }' | /usr/bin/tail -n +2 >> $LOG
# ensure that the log is readable
/bin/chmod 644 $LOG
done

