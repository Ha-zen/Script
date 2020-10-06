#!/bin/bash/
# IFS=
declare -a liste=( "openssh-server" "sudo" "nessus" )
# dpkg-query -W -f='${Status}' $liste
#check_pkg=$(printf "$pkg" && dpkg-query -W -f=' - ${version} - ${Status}\n' $pkg)
# grep "install ok installed"
for pkg in ${liste[@]}; do
    
    check_pkg=$(printf "$pkg" && dpkg-query -W -f='${Status}\n' $pkg | awk '{print $3}' )

    
    if [ ${check_pkg} == "installed" ]; then
    
    echo -e $pkg && dpkg-query -W -f=' - ${version}' && echo "est déjà installé"
    else
    echo "$pkg n'est pas installé"
    fi
    done
# else
    
# echo "$pkg n'est pas installé"
# echo ${liste[@]}