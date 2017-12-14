#!/bin/bash
clear

pingando(){
> relatorio
for nome in $(cat monitorados.csv | cut -d";" -f1); do
	for ip in $(cat monitorados.csv | grep ^$nome\; | cut -d";" -f2); do
		ping -W 1 -i 1 -c 1 $ip > /dev/null
		[[ $? == "0" ]] && \
		echo '{'$(date)'|' 'EQUIPAMENTO:'$nome'|' 'IP:'$ip']->UP''}' >> relatorio || \
		echo '{'$(date)'|' 'EQUIPAMENTO:'$nome'|' 'IP:'$ip']->DOWN''}' >> relatorio
	done
done
cat relatorio >> relatoriolog
}
pingando
