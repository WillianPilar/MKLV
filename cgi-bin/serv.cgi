#!/bin/bash

read VAR

echo "content-type: text/html"
echo

VAR=$(echo $VAR | cut -d"=" -f2)

iniciar(){
	./pingd.cgi &> /dev/null
}
encerrar(){
	killall pingd.cgi
}

echo "<html>"
echo "<head>"
echo "</head>"
echo "<body>"
echo "<script lang='javascript'>"
case $VAR in
	Iniciar)
		iniciar &> /dev/null
		echo "alert('Serviço iniciado.');"
		echo "location.href='../menu.html'"
		;;
	Encerrar)
		encerrar
		echo "alert('Serviço encerrado.');"
		echo "location.href='../menu.html'"
		;;
	Reiniciar)
		encerrar
		iniciar
		;;
	Status)
		ps -ef | grep "./pingd.cgi$" &> /dev/null
		if [[ $? == "0" ]] ; then
			echo "alert ('O programa está em funcionamento.');"
			echo "location.href='../menu.html'"
		else
			echo "alert ('O programa está desligado.');"
			echo "location.href='../menu.html'"
		fi
		;;
esac
echo "</script>"
echo "</body>"
echo "</html>"
