#!/bin/bash
read POST
echo content-type: text/html
echo
foi(){
cat <<EOFFF
  <html>
<head>
<script>alert("Cadastrado com sucesso!");</script>
<meta http-equiv="refresh" content=0;url="../index.html">
</head>
  </html>
EOFFF
}

foinao(){
cat <<EOFFF
  <html>
<head>
<script>alert("Erro no cadastro, Redirecinando...");</script>
<meta http-equiv="refresh" content=0;url="../cadastro.html">
</head>
  </html>
EOFFF
}

usuario=$(echo $POST | cut -d"&" -f1 | cut -d"=" -f2)
senha=$(echo $POST | cut -d"&" -f2 | cut -d"=" -f2)
csenha=$(echo $POST | cut -d"&" -f3 | cut -d"=" -f2)

if [[ $senha != $csenha ]] ; then
	foinao
	break
elif [[ ! $(grep "^$usuario;" PASSW) ]] ; then
        if [[ $usuario == "" || $senha == "" ]] ; then
                foinao
        else
senha=$(echo $senha | sha256sum | cut -d" " -f1)
   echo "$usuario;$senha" >> PASSW
   foi
        fi
else
   foinao
fi
fi
