#!/bin/bash/
# IFS=
declare -a liste=( "ssh" "nmap" )
#dpkg-query -W -f='${Status}' $liste | grep -q -P '^install ok installed$'; echo $?


for pkg in ${liste[@]}; do
    echo ${pkg}  
done
echo ${liste[@]}