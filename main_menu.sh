#!/bin/bash

authentification_menu(){

echo "MENU AUTHENTIFICATION

1. Port SSH
2. Permit Root Login
3. Key SSH
4. PWD SSH
5. Generer une cle SSH"

}

network_menu(){

echo "MENU RESEAU

1. Information Reseau
2. Definir le WAN
3. Net Plan
4. Routage
5. NAT"

}

security_menu(){

echo "MENU SECURITE

1. Firewall"

}


application_menu(){

echo "MENU APPLICATION

1. NGINX
2. APACHE
3. PHP My Admin"

}

help_menu(){

echo "MENU AIDE

1. Information
2. Regle de securite"

}
while true
do

  #..........................................................................
  # MENU PRINCIPAL
  #..........................................................................

  clear
  echo "
 _   __   _   ______  _____      ___  
| | |  \ | | /  ___/ |_   _|    /   | 
| | |   \| | | |___    | |     / /| | 
| | | |\   | \___  \   | |    / / | | 
| | | | \  |  ___| |   | |   / /  | | 
|_| |_|  \_| /_____/   |_|  /_/   |_|   
  
  
  
  MENU PRINCIPAL

1. Authentification
2. Reseau
3. Securite
4. Application
5. Aide

0. Prendre la fuite

Veuillez entrer un chiffre (parmi les choix possibles)
"

  #..........................................................................
  # Saisie d'une touche et gestion
  #..........................................................................
  
  read answer
  clear

  case "$answer" in
    [1]*) authentification_menu;;
    [2]*) network_menu;;
    [3]*) security_menu;;
	[4]*) application_menu;;
	[5]*) help_menu;;

    [0]*)  echo "sortie du programme" ; exit 0 ;;
    *)     echo "Choisissez une option affichee dans le menu:" ;;
  esac
  echo ""
  echo "tapez RETURN pour le menu"
 read dummy
done
