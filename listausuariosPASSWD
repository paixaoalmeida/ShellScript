#!/usr/bin/env bash

#Programa que extrai usuários da pasta /etc/passwd

#Extrai usuários do arquivo passwd e pode colocar em maiusculo ou em ordem alfabetica

#---------------------------------------------------------------------------------------
#v1.0 / 21 abril 20:44
   #-adicionado menu de ajuda (-h)
   #-adicionado funcao de verificar versao (-v)
   #-adicionado funcao de colocar a lista em ordem alfabetica (-s)

   #v1.1 / 21 abril 20:46
   #-adicionando basename no nome do script
   #-adicionando funcao de letra maisucula (-m)
   #-mensagem de erro se houver uma variavel invalida (*)
   #-funcao letra maiuscula em ordem alfabetica (-m)
   #-funcao case no código (onde junta todos os if e then)

   #v1.2/ 24 abril 21:53
   #adicionado mensagem de boas vindas
   #funcao que só pode rodar sendo root
   #variavel erro retirada (sera colocada em breve)
   #diminui drasticamente o tamanho do código, estava muito poluido
   #mesmo problema de outros códigos, eu coloco um if com alguma função, mas os echos executam junto, o que deixa feio, irei arrumar

   #---------------------------------------------------------------------------------------
#VARIÁVEIS

MAIUSCULO="$(cat /etc/passwd | cut -d : -f 1)"


#variavel que extrai a lista de usuarios do diretório /etc/passwd
USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"

#variavel de parametro de ajuda -h
#o basename é para tirar o ./ na execucacao do script (deixar mais bonito)
MENSAGEM_USO="
 $(basename $0) - [OPÇÕES]

  Executar o script sem nenhum parametro irá dar todos os usuários
 -h - Menu de ajuda
 -v - Versão
 -s - Lista de users em ordem alfabetica
 -m - Lista de users em ordem alfabetica e letra maiuscula
"
VERSAO="Versão: v1.1"
#----------------------------------------------------------------------------------------

#O usuário é ROOT?
if [ "$(id -u)" = "1000" ]
then
  echo -e "\e[31;5;1mVOCÊ SÓ PODE EXECUTAR COMO ROOT \e[m" && exit 0
fi

#CÓDIGO DO PROGRAMA

#MENU DE ajuda (v1.1)
case "$1" in
  -h) echo "$MENSAGEM_USO" && exit 0                            ;;
  -v) echo "$VERSAO" && exit 0                                  ;;
  -s) echo "$USUARIOS" | sort && exit 0                         ;;
  -m) echo "$MAIUSCULO" | tr [a-z] [A-Z] | sort && exit 0       ;;
esac


#Tela inicial quando o script é executado sem parametros
echo -e "\e[32;1mBEM VINDO ao Showuser.sh! \e[m \n"
echo -e "\e[35;1mO script extrai os usuários do documento passwd (Sistemas Unix/Linux) \e[m \n"
echo -e "\e[33;mUSE O PARAMETRO -h para visualizar o menu de execução desse script! \e[m"
