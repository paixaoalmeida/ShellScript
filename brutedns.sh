
#Script que faz bruteforce de subdominios

domain=$1

while read sub;do
  if host $sub.$domain &> /dev/null;then
    echo "$sub.$domain";
  fi
done < listadns.txt
