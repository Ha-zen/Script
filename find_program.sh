#!/bin/bash/
# IFS=
#declare -a liste=( "ssh" "nmap" )
#dpkg-query -W -f='${Status}' $liste | grep -q -P '^install ok installed$'; echo $?
# T=$(ps -el | awk '{print $14}' | awk 'NR>2')
# # echo "${T}"
# for value in ${T}
#     do echo "${value}"
#     # liste=(${value})  
# done
# echo ${liste[@]}

# whiptail --title "titre" --infobox "Ceci est un message" 8 78

check_pkg="installed"

if [ ${check_pkg} == "installed" ]; then
    
    echo "est déjà installé"
    else
    echo " n'est pas installé"
    fi