# Script
Script TP sécu


affichage qui montre si les technos sont deja là 

boites a cocher avec les programmes à installer

verification des programmes déjà installés selon la distrib

attack 
defense 
fore and seek 
admin

Sites utilisés :
- https://aplicacionesysistemas.com/en/dialog-crear-menus-tus-scripts/
- https://bash.cyberciti.biz/guide/Bash_display_dialog_boxes
- https://askubuntu.com/questions/25077/how-to-really-clear-the-terminal

Accès Kali :

https://sshpve.nateacloud.fr/
id : mtimoteo
mdp : Insta2020.
Realme : Proxmox VE Authentication Server

Credentials VMs : id : romain mdp : natea

Check if package is installed or not.
https://stackoverflow.com/questions/1298066/check-if-an-apt-get-package-is-installed-and-then-install-it-if-its-not-on-linu


dpkg-query -W -f='${Status}' nmap | grep -q -P '^install ok installed$'; echo $?

Clément insiste pour intégrer ce lien : https://github.com/hack4liberty/tsunami-install-script

Voilà qui est fait.
