#!/bin/bash
G='\033[0;92m'
B='\033[0;94m'
N='\033[0m'
#cd /usr/share/figlet && git clone https://github.com/xero/figlet-fonts.git
figlet -f /usr/share/figlet/figlet-fonts/3d.flf "   FastNmap" -w 200 | lolcat
echo -e "${G}                                                           Automation by Kartik - @Hackito${N}"
echo
if [ $# -eq 0 ]
  then
    echo 'No arguments supplied, kindly type "./fastnmap {IP}" '
    echo
else
        naabu="$1""naabu.txt"
        port="$1""ports"
        nmap="nmap -A $1 -o nmap -Pn -p"
        first=true
        cd $1
        naabu -host $1 -p - -o $naabu
        cut -f 2 -d ":" $naabu > $port
        for line in $(cat $port); do
          if [ "$first" = true ]; then
            nmap="$nmap$line"
            first=false
          else
            nmap="$nmap,$line"
          fi
        done
        echo
        echo
        echo -e "${G}Executing command:  ${N}""${B}$nmap${N}"
        echo
        eval "$nmap"
        rm $naabu $port
fi
