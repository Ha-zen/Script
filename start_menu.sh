#!/bin/bash
#Debut du script : mise a jour et installation de "dialog"

apt-get update
apt-get install dialog

#Debut du script de securisation
dialog --title "INFRASEC" --msgbox 'Bonjour, ce script a pour but blablabla' 20 50
