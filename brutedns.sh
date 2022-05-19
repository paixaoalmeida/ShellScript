#!/usr/bin/env bash


#Script que faz bruteforce de subdominios

domain=$1

COR_VERMELHO="\e[31;1;4m \n"

COR_YELLOW="\e[33;1m"
#-------------------------------------------------------------------------------

while read sub;do
  if host $sub.$domain &> /dev/null;then
    echo -e ${COR_VERMELHO} "Dominios encontrados:" ${COR_YELLOW}"$sub.$domain";
  fi
done < listadns.txt
