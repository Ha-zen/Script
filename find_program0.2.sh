#!/bin/bash/
# IFS=
declare -a liste=( "openssh-server" "sudo" "nessus" )
# dpkg-query -W -f='${Status}' $liste
#check_pkg=$(printf "$pkg" && dpkg-query -W -f=' - ${version} - ${Status}\n' $pkg)

for pkg in ${liste[@]}; do
    check_pkg=$(printf "$pkg" && dpkg-query -W -f=' - ${version} - ${Status}\n' $pkg)
    if ["${check_pkg}" == "install ok installed"]; then
    echo "$pkg est déjà installé"
    fi
done
# else
    
# echo "$pkg n'est pas installé"
# echo ${liste[@]}