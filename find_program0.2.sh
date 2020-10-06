#!/bin/bash/
# IFS=
declare -a liste=( "openssh-server" "sudo" "nessus" )
# dpkg-query -W -f='${Status}' $liste
#check_pkg=$(printf "$pkg" && dpkg-query -W -f=' - ${version} - ${Status}\n' $pkg)
# grep "install ok installed"
for pkg in ${liste[@]}; do
    
    check_pkg=$(dpkg-query -W -f='${Status}\n' $pkg 2>/dev/null | awk '{print $3}' )
    version_pkg=$(dpkg-query -W -f=' - ${version}' $pkg 2>/dev/null )
    # echo $check_pkg
    
    if [ "${check_pkg}" == "installed" ]; then
        echo -e "$pkg $version_pkg est déjà installé"
    else
        echo "$pkg n'est pas installé"
    fi

    # if [ "${check_pkg}" != "installed" ]; then
    #     echo "$pkg n'est pas installé"
    # fi
done
# else
    
# echo "$pkg n'est pas installé"
# echo ${liste[@]}