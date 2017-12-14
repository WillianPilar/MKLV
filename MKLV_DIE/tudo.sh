#!/bin/bash
falhou(){
	case $1 in
	instalacao)
		echo "O programa falhou durante a instalacao"
		exit  0 ;;
		*)
		echo "O programa falhou. Erro desconhecido"
	esac
}
apt-get update && apt-get install dialog -y || falhou instalacao
sudo ./vic.sh
