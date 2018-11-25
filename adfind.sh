#!/bin/bash
#Tatsumi-Crew & Arvan Apriyana
#thanks to - monkey b luffy
clear
header(){
printf "
___________________________________________________________

 ████████╗ █████╗ ████████╗███████╗██╗   ██╗███╗   ███╗██╗
 ╚══██╔══╝██╔══██╗╚══██╔══╝██╔════╝██║   ██║████╗ ████║██║
    ██║   ███████║   ██║   ███████╗██║   ██║██╔████╔██║██║
    ██║   ██╔══██║   ██║   ╚════██║██║   ██║██║╚██╔╝██║██║
    ██║   ██║  ██║   ██║   ███████║╚██████╔╝██║ ╚═╝ ██║██║
    ╚═╝   ╚═╝  ╚═╝   ╚═╝   ╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝
  
  	               Admin Finder Tools      
  	              www.tatsumi-crew.net
___________________________________________________________

"
}
# function
scan(){
CYAN='\e[36m'
BLUE='\e[34m'
GREEN='\e[92m'
WHITE='\e[37m'
RED='\e[31m'
YELLOW='\e[33m'
GREENLIGHT='\e[39m'
PURPLE='\e[35m'
BOLD='\e[1m'
		url="$1" #URL 
		path="$2" # read wordlist
		cek=$(curl -s -o /dev/null -w "%{http_code}" $url/$path)
		if [ "$cek" = "301" ] || [ "$cek" = "302" ] || [ "$cek" = "201" ]
          then
          printf "${GREEN}FOUND =>${NC} $url$path\n"
          echo "$url$path" >> nemu.txt
           else
          printf "${RED}NOT FOUND${NC} => $url$path\n"
		fi

}

if [ -z $1 ]; then
  header
  printf "\n To Use http://site.com list.txt \n"
  exit 1
fi

header

web=$1

# OPTIONAL
persend=20
setleep=5

itung=1

IFS=$'\r\n' GLOBIGNORE='*' command eval 'list=($(cat list.txt))'
for (( i = 0; i < "${#list[@]}"; i++ )); do

  nako48=$(expr $itung % $persend)
    if [[ $nako48 == 0 && $itung > 0 ]]; then
        sleep $setleep
    fi

    list="${list[$i]}"
  scan ${web} ${list} &
    itung=$[$itung+1]
done
wait
