#!/bin/bash/
# IFS=
declare -a liste=( "openssh-server" "sudo" "nessus" )
# dpkg-query -W -f='${Status}' $liste
#check_pkg=$(printf "$pkg" && dpkg-query -W -f=' - ${version} - ${Status}\n' $pkg)

for pkg in ${liste[@]}; do
    
    check_pkg=$(printf "$pkg" && dpkg-query -W -f='${Status}\n' $pkg | grep "install ok installed")

    
    if [ "${check_pkg}" == "install ok installed" ]; then
    
    echo -e '$pkg && dpkg-query -W -f=' - ${version}' est déjà installé'
    else
    echo "$pkg n'est pas installé"
    fi
    done
# else
    
# echo "$pkg n'est pas installé"
# echo ${liste[@]}