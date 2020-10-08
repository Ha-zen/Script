#!/bin/bash/

#########################################################
# fonction qui trouve le type système d'initialisation sur la machine
system=$(ls -l /sbin/init | awk '{print $NF}')
if [ $system == /lib/systemd/systemd ]; then

systemis="systemd"

else

systemis="init"

fi

#########################################################


# dialog --checklist "liste des programmes à installer"
#         vide
#         vide
#         vide
#         vide
#         vide
#         vide
#         vide
#         vide
#         vide
#         vide
#         vide
#         vide

