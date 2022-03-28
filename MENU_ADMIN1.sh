#!/bin/bash

clear

########### VARIABLES #############

RED='\e[0;31m'
GREEN='\033[0;32m' 
RESTORE='\033[0m'
PS3=""


########### FONCTIONS #############

source FUNC_STOCK.sh
source script_func_tdulti.sh  #DEDANS YA :

#FUNC_INFO_MATOS, permet d'obtenir fabricant du sys, architecture du processeur, mémoire vive de la machine, Taux d'occupation du disque, adresse ip.
#FUNC_INFO_SYS, on obtient nom de la dsitro, version du noyau, shell par default, utilisateur actuel
#FUNC_PKG_UPDATE, update avec apt ou dnf selon la distro
#FUNC_LIST_USERS, liste les utilisateurs humain de la machine
#FUNC_ROOT_CHECK, prompt pour lancer en root
#FUNC_CHECK_CHOIX, verifie que le choix fait parti du menu
#FUNC_SAVE, permet de sauvegarder le dossier utilisateur au format bz2
#FUNC_BANNER, banniere du programme
#FUNC_TAIL, prompt pour tapez entrez et revenir au menu


########### SCRIPT ################

#INPUT-MENU

FUNC_ROOT_CHECK #verifie que l'utilisateur est bien en sudo ou root, sinon exit 1

FUNC_BANNER #Banniere du programme
echo -e "${GREEN}Selectionnez une option:\n${RESTORE}" 

#cmd "select" = créé la variables CHOIX + créé le menu avec option + permet le retour au menu 

select CHOIX in "Obtenir des informations sur le hardware" "Obtenir des informations sur le software" "Faire une mise à jour de votre distribution linux" "Lister les utilisateurs de cette machine" "Sauvegarder un dossier ou un fichier" "Quitter ce script" "Gérer le Stockage"
do



#OUTPUT-MENU:

case $CHOIX in

  "Obtenir des informations sur le hardware") #info materiel
    clear
    FUNC_BANNER
    FUNC_INFO_MATOS
    FUNC_TAIL
    ;;

  "Obtenir des informations sur le software") #info logiciel
    clear
    FUNC_BANNER 
    FUNC_INFO_SYS
    FUNC_TAIL
    ;;

  "Faire une mise à jour de votre distribution linux") #faire mise à jour en fonction de la distro
    clear
    FUNC_BANNER
    FUNC_PKG_UPDATE
    FUNC_TAIL
 
    ;;

  "Lister les utilisateurs de cette machine") #Lister les utilisateur de la machine
    clear
    FUNC_BANNER
    FUNC_LIST_USERS
    FUNC_TAIL
    ;;
    
  "Sauvegarder un dossier ou un fichier") #Sauvegarder doss user avec tar
    clear
    FUNC_BANNER
    FUNC_SAVE
    FUNC_TAIL
    ;;
   
   "Gérer le Stockage") 
    clear
    FUNC_BANNER
    FUNC_STOCK
    FUNC_TAIL
    ;;
    
    
  "Quitter ce script") #Quitter script
    exit 0
    ;;
esac
done


