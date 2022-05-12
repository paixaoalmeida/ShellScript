#!usr/bin/env bash

#dia 11 de maio ás 22:00

#o $# significa que vai pegar todos os parametros, o -ne é not equal , se não der um parametro irá dar uma mensagem de exemplo
if [ $# -ne 1 ]
then
   echo "Você deve inserir um arquivo ou diretório"
   echo "Exemplo: $0 + nome do arquivo ou diretorio"
fi

#-e é para verificar se um arquivo/diretório existe
if [ -e $1 ]
then
   echo "O arquivo ou diretório é existente"
fi

#-f é para verificar se o arquivo é realmente um arquivo
if [ -f $1 ]
then
   echo "É um arquivo"
elif [ -d $1 ]
then
   echo "É um diretório"
fi

#-r é para verificar se um arquivo/diretório ter permissão de leitura
if [ -r $1 ]
then
   echo "Você tem permissão de leitura nesse arquivo/diretório"
else
   echo "Você não tem permissão de leitura nesse arquivo/diretório"
fi

#-x é para verificar a exeucução de um arquivo/diretório
if [ -x $1 ]
then
  echo "Você tem permissão de execução nesse diretório/arquivo"
else
  echo "Você não tem permissão de execução nesse diretório/arquivo"
fi

exit 0
