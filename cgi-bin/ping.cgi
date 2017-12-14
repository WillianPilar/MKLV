#!/bin/bash
IFS=$'\n'

rm -rf arm_info.log
touch arm_info.log
chmod 777 arm_info.log
for name in $(cat registrados.csv | cut -d";" -f1) ; do
	for location in $(grep "^$name;" registrados.csv | cut -d";" -f2) ; do
		for ip in $(grep "^$name;" registrados.csv | cut -d";" -f3) ; do
			ping -W 1 -c 1 -i 1 $ip &> /dev/null
			if [[ $? == "0" ]] ; then
				echo "$(date);$name;$location;$ip;UP" >> arm_infolog.log
				echo "$name;$location;$ip;UP" >> arm_info.log
			else
				echo "$(date);$name;$location;$ip;DOWN" >> arm_infolog.log
				echo "$name;$location;$ip;DOWN" >> arm_info.log
			fi
		done
	done
done
