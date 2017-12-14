#!/bin/bash
read POST
USER=$(echo $POST | cut -d"&" -f1 | cut -d"=" -f2)
linha=$(cat PASSW | grep "^$USER;")
usuario=$(echo $linha | cut -d";" -f1)
PASS=$(echo $POST | cut -d"&" -f2 | cut -d"=" -f2)
senha=$(echo $linha | cut -d";" -f2)
PASS=$(echo $PASS | sha256sum | cut -d" " -f1)
[[ $USER == $usuario ]] && [[ $PASS == $senha ]] && \
./redireciona.cgi menu.html || ./redireciona.cgi index.html

