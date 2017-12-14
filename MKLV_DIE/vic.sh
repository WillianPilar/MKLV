#!/bin/bash
falhou(){ dialog --msgbox "Usuário e senha inválidos" 0 0 ; login ; }
login(){
usuario=$(dialog --stdout --inputbox "Login: " 0 0)
senha=$(dialog --stdout --passwordbox "Senha: " 0 0)
[[ $usuario == "admin" ]] && [[ $senha == "admin" ]] && . menu.sh
[[  $usuario == "senaisp" ]] && [[ $senha == "senaisp" ]] && .  menu1.sh || falhou
}
dialog --title 'Bem vindo ao:' --msgbox 'M O N I T O R A M E N T O !' 6 31
login
