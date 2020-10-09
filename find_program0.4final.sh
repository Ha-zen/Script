#!/bin/bash

DIALOG_CANCEL=1
DIALOG_ESC=255

# fichier de résumer des actions
> tmp.txt
#--------------------------------
#Fonctions d'installation des outils prérequis commun au differents programme
#--------------------------------

InstallNmap () {
 sudo apt install nmap -y
}
InstallNcrack () {
 sudo apt install ncrack -y
}
InstallCurl () {
 sudo apt install curl -y
}
InstallJava () {
 sudo apt install openjdk-11-jre -y
 sudo apt install default-jre -y
}
#--------------------------------
#Fonctions installant les programmes
#--------------------------------

Tor_ssh() {
clear
# Install Tor
sudo apt update && sudo apt install -y tor
# Append the hidden service configuration to the Torrc file
sudo echo -e "HiddenServiceDir /var/lib/tor/onion-ssh/\nHiddenServicePort 22 127.0.0.1:22" > /etc/tor/torrc
# Remove the bogus tor service Ubuntu installs by default (https://askubuntu.com/a/903341)
sudo rm /lib/systemd/system/tor.service
# Ensure the changes are recognized
sudo systemctl daemon-reload
# Restart Tor to generate the new configuration
sudo /etc/init.d/tor restart
# Wait 30 seconds for the configuration to generate
counter=0
(
while :
do
cat <<EOF
XXX
$counter
Wait 30 seconds for Tor to start and generate the hostname ( $counter%)
XXX
EOF
((counter+=10))
[ $counter -eq 100 ] && break
sleep 3
done
) | dialog --title "Instalation de Tor_ssh" \
	--gauge "Please wait" 7 70 0
# Output the Hostname file contents.
hostname=$(cat /var/lib/tor/onion-ssh/hostname)
dialog --title "Instalation de Tor_ssh" \
	--msgbox "You can now SSH to: $hostname" 0 0
 echo "installation de Tor_ssh" >> tmp.txt
}

#Installation de Webmin
Webmin() {

mymachin=$( ip a | egrep global | awk '{print $2}' | awk -F/ ' {print $1}')
reponse_webmin="n"
numero_port_webmin="10000"
repok="nok"               

val=sudo cat /etc/apt/sources.list | egrep "deb http://download.webmin.com/download/repository sarge contrib" | wc -l
if [ "$val" = "0" ];then
    echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
    wget http://www.webmin.com/jcameron-key.asc
    apt-key add jcameron-key.asc
fi
echo " Veuillez patienter pendant l'installation ;D "
apt-get install apt-transport-https -y >> log.txt
apt-get update >> log.txt
apt-get install webmin -y >> log.txt
echo "L'application a ete installe "
echo "Voulez-vous modifier le port de l'interface webmin ? (10000 par defaut) "
read reponse_webmin
if [ $reponse_webmin = "yes" ] || [ $reponse_webmin = "y" ] || [ $reponse_webmin = "oui" ] || [ $reponse_webmin = "o" ];then
    echo "Quel numero de port voulez-vous affecter  l'interface webmin?"
    read numero_port_webmin
    while [ "$repok" != 'ok' ]
    do
    if [ -n $numero_port_webmin ] && [[ "$numero_port_webmin" =~ ^[0-9]+$ ]] && [ $numero_port_webmin -le 65535 ] && [ $numero_port_webmin -ge 1 ];then
    repok="ok"
    sed -i -e "s/port=10000/port=$numero_port_webmin/g" "/etc/webmin/miniserv.conf"
    /etc/init.d/webmin restart >> log.txt
echo "Votre Interface Webmin est accessible sur https://$mymachin:$numero_port_webmin"
    fi
    done
fi
exit 0 ;;

}
#--------------------------------

Tsunami() {
dialog --title "Instalation de Tsunami" \
	--msgbox "Tsunami va s\'installer avec Nmap, Ncrack, Curl et Java" 0 0
 clear
 InstallNmap
 InstallNcrack
 InstallCurl
 InstallJava
 bash -c "$(curl -sfL https://raw.githubusercontent.com/google/tsunami-security-scanner/master/quick_start.sh)"
chmod a+x tsunami-main-0.0.2-SNAPSHOT-cli.jar 
 echo "installation de Tsunami" >> tmp.txt
}

#--------------------------------
#Fonction pour valider l'instalation d'un programme
#--------------------------------

Installyesno () {
dialog --title "Instalation de $1"\
  --yesno "Vouler vous installer $1" 0 0
case $? in
 0)
 $1
  ;;
 1) dialog --title "Instalation de $1" \
	--msgbox "$1 ne sera pas installe" 0 0
  ;;
 255) dialog --title "Instalation de $1" \
	--msgbox "$1 ne sera pas installe" 0 0
  ;;
 esac
}

#--------------------------------
#Debut du Script
#--------------------------------

#mise à jour
sudo apt update -y
sudo apt upgrade -y


dialog --title "Programme-TP" \
	--msgbox "Bonjour, le programme suivant a pour fonction taratata..." 0 0
 
#--------------------------------
#Liste des programmes à installer 
#--------------------------------
while true; do
	exec 3>&1
	selection=$(dialog \
	--backtitle "System Information" \
	--title "Menu" \
	--clear \
	--cancel-label "Exit" \
	--menu "Please select:" 0 0 4 \
	"1" "Tor_ssh" \
	"2" "Tsunami" \
	"3" "Cat2 prog1" \
	"4" "Cat2 Prog2" \
	2>&1 1>&3)
	exit_status=$?
	exec 3>&-
 #--------------------------------
 #sortie du script
 #--------------------------------
 
	case $exit_status in 
  $DIALOG_CANCEL)
   fin=$(cat ./tmp.txt)
		dialog --title "FIN_Programme-TP" \
	--msgbox "$fin" 0 0
    clear
		exit
	;;
	$DIALOG_ESC)
	      clear
	      echo "Program aborted." >&2
	      exit 1
      	;;
	esac
#--------------------------------
#Appel des fonction en fonction du programme choisi
#--------------------------------

  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      Installyesno "Tor_ssh"
      ;;
    2 )
     Installyesno "Tsunami"    
      ;;
    3 )
    echo "Cat2 prog1" >> tmp.txt
    dialog --title "Programme-TP2.1_reponse" \
	--msgbox "blablabla" 0 0
      ;;
    4 )
    echo "Cat2 prog2" >> tmp.txt
    dialog --title "Programme-TP2.2_reponse" \
	--msgbox "blablabla" 0 0
  ;;
  esac
done
#--------------------------------
