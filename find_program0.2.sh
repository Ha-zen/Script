#!/bin/bash/
# IFS=
declare -a liste=( "openssh-server" "sudo" )
# dpkg-query -W -f='${Status}' $liste


for pkg in ${liste[@]}; do
    echo "$pkg" | dpkg-query -W -f=' - ${version} - ${Status}\n' $pkg
done


# echo ${liste[@]}