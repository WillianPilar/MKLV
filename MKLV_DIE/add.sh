#!/bin/bash
paraerro(){
	dialog --msgbox "Valor digitado na variável $1 é inválido" 0 0 ; menu
}
adicionar(){
	NOME=$(dialog --stdout --inputbox 'Nome do equipamento:' 0 0)
	echo $NOME > NOME
	IP=$(dialog --stdout --inputbox 'IP do equipamento:' 0 0)
	echo $IP > IP
	if [[ $(egrep '^[a-zA-Z]{1,8}[0-9]{0,4}$' NOME) ]] ; then
		if [[ $(egrep '^([0-9]{1,3}\.{0,1}){4}$' IP) ]] ; then
			if [[ ! $(grep $IP$ monitorados.csv) ]] ; then
	  		MSG='Equipamento adicionado com sucesso!!!!'
 				echo "$NOME;$IP" >> monitorados.csv && dialog --msgbox "$MSG" 6 40
			else
				dialog --msgbox "Este IP já existe!" 0 0 ; menu
			fi
		else
			paraerro IP
		fi
	else
		paraerro NOME
	fi
	menu
}
remover(){
  IP=$(dialog --stdout --inputbox 'IP do equipamento a ser removido:' 0 0)
	if [[ $(grep $IP$ monitorados.csv) ]] ; then
		cp monitorados.csv backup/bkp.$(date +'%Y%m%d%H%M%S')
		cat monitorados.csv | sed "/$IP$/d" > monitorados.bkp
		cat monitorados.bkp > monitorados.csv
		dialog --msgbox "Equipamento monitorado removido" 0 0
		menu
	else
		dialog --msgbox "Este IP não existe!" 0 0
		menu
	fi
}
menu(){
	oi=$( dialog --stdout \
        --title 'Equipamentos' 	\
	--menu 'Escolha o que deseja fazer:' 0 0 10 	\
	1 'Adicionar equipamento' 										\
	2 'Remover equipamento' 											\
	3 'Voltar ao menu principal')
	case "$oi" in
	1) adicionar ;;
	2) remover ;;
	3) . menu.sh ;;
	esac
}
menu
