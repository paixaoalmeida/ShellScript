#!usr/bin/env bash

#v1.0
#Script que atualiza os repositórios, faz o upgrade e no final também exclui pacotes com o sudo apt autoremove

#Não terá parametros, apenas mensagem de erro se algo falhar

#dia 22 abril de 2020 / 22:12

#testado em GNU bash, versão 5.0.17(1)-release (x86_64-pc-linux-gnu)

#v1.1
#retirado a funcao apt autoremove (que exclui dependencias de pacotes desisntalados, ou que tiveram erro na instalação)
#questão de segurança do sistema, irei pesquisar melhor antes de colocar essa função novamente!
#------------------------------------------------------------------------------------------------------------------

#VARIÁVEIS













#--------------------------------------------------------------------------------------------------------------------

#CÓDIGO DO PROGRAMA
if [ "$(id -u)" = "1000" ]
then
  echo -e "\e[31;1;5mVOCÊ NÃO É ROOT SAI \e[m" && exit 0
fi

echo -e "\e[31;5;1mOPERAÇÕES UPDATE E UPGRADE \e[m"

echo "$(apt update)"

echo "$(apt upgrade)" && echo -e "\e[31;5;1mOPERAÇÕES CONLUIDAS. \e[m"
