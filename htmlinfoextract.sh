#!/usr/bin/env bash

#Script extrai titulos de sites da internet pelo HTML e mostrar na tela
#netinfoextract

#-----------------------------------------------------------------------------------------
#VERSÕES/ATUALIZACOES

#versão v1.0
#dia 23 abril 21:59
#testado em GNU bash, versão 5.0.17(1)-release (x86_64-pc-linux-gnu)
#-Verifica se o lynx está instalado, notifica o usuário e instala o lynx
#-dá um lynx -source na página que for escrita (site.com.br) ($1)

#versão v1.1
#dia 24 abril 11:42
#testado em GNU bash, versão 5.0.17(1)-release (x86_64-pc-linux-gnu)
#-Adicionado um menu de ajuda
#ao inves de usar só if e then, usei o case e adicionei parametros para a variável $1
#parametro -e (verifica se o lynx está instalado)
#parametro -l (instala o lynx no sistema via APT)
#parametro -h (Abre o menu de ajuda)
#(falta arrumar o título quando roda o script sem parametro, mas vou fazer isso logo logo)


#versão v1.1
#dia 24 abril 20:52
#adicionado versão do Script (-v)
#adicionado -s (usando o lynx para pegar o HTML de uma pagina web)
#Modo do script iniciar sem parametro arrumado (agora ele dá um guia para o menu de ajuda)
#adicionado função que só executa o script como root
#(precisa ser arrumado o fato de que quando executa um parametro ele junto da os dois echos que tem no começo!!!)

#versao v1.2
#dia 06 maio 00:54
#adicionado o apt-get, onde não dá mais o erro de CLI instável!! (estou meio off mas estou voltando nos projetos)
#Tentando tirar o echo quando não é requisitado (quando excuta com parametro -h aparece mensagens de boas vindas juntos)
#esta sendo um desafio mas vou pesquisar e achar (07 maio 01:45)
#dia 6 de maio 18:16 (consegui tirar o "bug" que fazia os echos aparecerem junto com os parametros!!!!)
#dia 6 de maior 23:46
#Agora gera um documento "site.html", basta dar um cat que você pode visualizar!
#alterei isso, coloquei toda a saída dos comandos num arquivo chamado "titulos.txt"
#Só funciona em páginas html que tem como o começo e final do titulo o <h3> </h3>
#ficou lindo, mas preciso arrumar um jeito de globalizar!!!! as paginas html todas tem um padrao unico





#------------------------------------------------------------------------------------------
#VARIÁVEIS

INSTALL_LYNX="$(apt-get install lynx)"

EXIT_SCRIPT="$(exit 0)"

LYNX_ESTA="$(which lynx)"

MENSAGEM_AJUDA="
$(basename $0) - MENU DE AJUDA

-h (Abre o menu de ajuda)
-e (Verifica se o lynx está instalado no sistema
-l (Instala o lynx no sistema, caso não esteja instalado)
-v (Verifica a versão do script)
-s (Coloque a URL do site que você desejar)
"

SOURCE_LYNX="$(lynx -source "$2" > site.html)" && "$(grep h3 site.html | cut -d "<" -f2 | cut -d ">" -f2 > titulos.txt)" && exit 0

VERSAO="v1.1"

TITULO_ARQUIVO="titulos.txt"

COR_RED="\e[31;1m"

COR_YELLOW="\e[33;1m"




#--------------------------------------------------------------------------------------------
#O usuário é ROOT?
if [ "$(id -u)" = "1000" ]
then
  echo -e "\e[31;5;1mVOCÊ SÓ PODE EXECUTAR COMO ROOT \e[m" && exit 0
fi


#CÓDIGO DO PROGRAMA

#O lynx está instalado?
if [ "$(which lynx)" = "lynx not found" ]
then
  echo -e "\e[31;1mBEM-VINDO! VERIFIQUE SE O LYNX ESTÁ INSTALADO USANDO O PARAMETRO -e \e[m \n"  &&
  echo -e "\e[32;1mSE NÃO ESTIVER, ULTILIZE O PARAMETRO -l para instala-lo \e[m \n" &&
  echo -e "\e[28;1mSE PRECISAR DO MENU DE AJUDA, USE O PARAMETRO -h \e[m" && exit 0
fi

#Parametro -l para instalar o lynx; -e para verificar se está instalado; -h para o menu de ajuada; -v mostra a versão do script ; -s para inserir o site
case "$1" in
  -l) echo "$INSTALL_LYNX" && exit 0                                                                                                                                                              ;;
  -e) echo "$LYNX_ESTA" && exit 0                                                                                                                                                                 ;;
  -h) echo "$MENSAGEM_AJUDA" && exit 0                                                                                                                                                            ;;
  -s) echo "$SOURCE_LYNX"                                                                                                                                                                         ;;
  -v) echo "$VERSAO" && exit 0                                                                                                                                                                    ;;
   *) echo -e "\e[33;1mNETINFOEXTRACT : Extrai títulos de páginas via HTML usando o lynx e gera um arquivo site.html! \e[m \n" && echo -e "\e[32;1mPARA SABER OS PARAMETROS DE ULTILIZAÇÃO, PRESSIONE o -h \e[m" && exit 0     ;;
esac

#ler o conteudo do arquivo "site.html" e colocar cores EXIT_SCRIPT
while read -r titulos_txt
do
  echo -e "${COR_RED}Titulo:  ${COR_YELLOW}$titulos_txt"
done < "$TITULO_ARQUIVO"




#----------------------------------------------------------------------------------------------------------------------------------------------------------
