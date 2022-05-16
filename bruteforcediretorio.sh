#!usr/bin/env bash


diretorios="listadiretorios.txt"


while read diretorios;do
  echo "tentando diretórios: $diretorios"
  curl  --write-out %{http_code} --output /dev/null --silent https://$1/$diretorios
done < "$diretorios"

#EM PRODUCAO EM PRODUCAO EM PRODUCAO EM PRODUCAO EM PRODUCAO EM PRODUCAO EM PRODUCAO
