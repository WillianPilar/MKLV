#!/bin/bash
IFS=$'\n'
read SO
VAI=$(echo $SO | cut -d"=" -f2)
echo "content-type: text/html"
echo
um(){
	for x in $(cat ./arm_info.log); do
		echo "<p>$x</p>"
	done
}

dois(){
	for x in $(cat ./arm_infolog.log); do
		echo "<p>$x</p>"
	done
}

if [[ $VAI == "atual" ]] ; then
um
elif [[ $VAI == "completo" ]] ; then
dois
else
echo "Opção Inexistente"
fi
