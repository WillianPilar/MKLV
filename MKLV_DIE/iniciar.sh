#!/bin/bash
menu(){
resposta=$(
dialog --stdout \
--title 'SERVIÇOS' \
--menu 'Escolha uma opção:' \
0 0 10 \
1 'Iniciar serviço' \
2 'Parar serviço'   \
3 'Status do serviço'  \
4 'Voltar ao menu principal' )
case "$resposta" in
1) iniciar ;;
2) parar ;;
3) status ;;
4) break ;;
*) echo "Opção invalida" ;;
esac
}
iniciar(){
./pongg.sh &> /dev/null & echo $!>/var/run/pongg.pid &&
dialog --title 'Atualmente' --msgbox 'O serviço ESTÁ em execução' 0 0
pid="cat /var/run/pongg.pid"
}
parar(){
kill "cat /var/run/pongg.pid"
rm /var/run/pongg.pid
dialog --title 'Atualmente' --msgbox 'O serviço NÃO está em execução' 0 0
}
status(){
 if [ -e /var/run/pongg.pid ]; then
     dialog --msgbox 'O serviço ESTÁ em execução' 0 0;
pid="cat/var/run/pongg.pid"
 else
    dialog --msgbox 'O serviço NÃO está em execução' 0 0
 fi    }
menu
