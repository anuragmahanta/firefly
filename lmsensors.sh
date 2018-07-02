#!/bin/bash
#Please try this in test environment first. If you are satisfied , then please you use it or modify it accorfing to your system's requirements
#To run this script yo have to configure two things.
#lmsensors
#mail server (I am running this in fedora 24 (4.11.12-100.fc24.x86_64))
############script to send mail if temperature exceeds 34 degree Celsius#########
ALERT="34"
MY_TEMP=$(/bin/sensors | grep "^Package" | grep -e '+.*C' | cut -f 2 -d '+' | cut -f 1 -d ' ' | sed 's/°C//')
echo $MY_TEMP
echo $ALERT
#if [[$MY_TEMP -ge $ALERT]];
if (( $(echo "$MY_TEMP > $ALERT" | bc -l) ));
then
echo "Hey Admin , check temp using lm_sensors in <your_server_name>.. it is $MY_TEMP degree celsius" | mail -s "Urgent!!!!!!!!!Check temperature ASAP" -r <sender mail ID> <reciever mail ID>
fi
