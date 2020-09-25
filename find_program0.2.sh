#!/bin/bash/
# IFS=
declare -a liste=( "ssh" "nmap" )
# dpkg-query -W -f='${Status}' $liste


for pkg in ${liste[@]}; do
    dpkg-query -W -f='${Status}' $pkg  
done
# echo ${liste[@]}