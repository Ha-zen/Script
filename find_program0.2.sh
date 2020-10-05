#!/bin/bash/
# IFS=
declare -a liste=( "openssh-server" "sudo" "nessus" )
# dpkg-query -W -f='${Status}' $liste


for pkg in ${liste[@]}; do
    printf "$pkg" && dpkg-query -W -f=' - ${version} - ${Status}\n' $pkg
done


# echo ${liste[@]}