#!/bin/bash/
# IFS=
declare -a liste=( "openssh-server" "sudo" "sed" "nessus" "docker" )
vide=()
liste_pkg=()
liste_pkg_ok=()
liste_pkg_pas_ok=()
# dpkg-query -W -f='${Status}' $liste
#check_pkg=$(printf "$pkg" && dpkg-query -W -f=' - ${version} - ${Status}\n' $pkg)
# grep "install ok installed"
for pkg in ${liste[@]}; do
    
    check_pkg=$(dpkg-query -W -f='${Status}' $pkg 2>/dev/null | awk '{print $3}' )
    version_pkg=$(dpkg-query -W -f=' - ${version}' $pkg 2>/dev/null )
    # echo $check_pkg
    
    # if [ "${check_pkg}" == "installed" ]; then
    #     echo -e "$pkg $version_pkg  est déjà installé"
    # else
    #     echo "$pkg n'est pas installé"
    # fi

    if [ "${check_pkg}" == "installed" ]; then
        liste_pkg_ok=( "$pkg" )
        # liste_pkg_ok=( "$pkg $version_pkg" )
        
        echo -e "$liste_pkg_ok 1"
    else
        
        liste_pkg_pas_ok=( $pkg )
        # echo -e "$liste_pkg_pas_ok\n"
    fi
    # liste_pkg+=$((liste_pkg_ok))
    
    for ((i=0; i<${liste_pkg_ok[*]}; ++i ))
    do
        echo ${liste_pkg_ok[$i]} >> list
    done

done
echo -e "$liste_pkg_ok 2"
# efface les valeurs vide dans la liste $liste_pkg_pas_ok
# for target in "${vide[@]}"; do
#   for i in "${!liste_pkg_pas_ok[@]}"; do
#     if [[ ${liste_pkg_pas_ok[i]} = $vide ]]; then
#       unset 'liste_pkg_pas_ok[i]'
#     fi
#   done
# done

# echo -e "$liste_pkg_pas_ok"
# echo "${(@j./.)liste_pkg_pas_ok:#}"

# echo "$liste_pkg_pas_ok n'est PAS ok"
# else
    
# echo "$pkg n'est pas installé"
# echo ${liste[@]}



# liste_pkg_ok=()
# liste_pkg_pas_ok=()
#     if [ "${check_pkg}" == "installed" ]; then
#         liste_pkg_ok=( $pkg $version_pkg )
#     else
#         liste_pkg_pas_ok=( $pkg )
#     fi

#     echo ${liste_pkg_ok}
#     echo ${liste_pkg_pas_ok} 