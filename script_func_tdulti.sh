#!/bin/bash

FUNC_INFO_MATOS(){
#var
GREEN='\033[0;32m'
RESTORE='\033[0m'

#code
echo -e "$GREEN \t\t\t INFORMATIONS HARDWARE $RESTORE" #affiche le titre: INFO HARDWARE

# Afficher le Fabricant du systeme
echo -e "${GREEN}Fabricant du système\t\t\t:${RESTORE}" `sudo dmidecode -s system-manufacturer`


# Le type d'architecture processessor
echo -e "${GREEN}Architecture du processeur\t\t:${RESTORE}" `sudo dmidecode -s processor-family`

#Memoire vive de la machine
echo -e "${GREEN}Mémoire vive de la machine\t\t:${RESTORE}" `free -h | grep Mem | cut -d" " -f11`

# Le taux d'occupation de la partition système
echo -e "${GREEN}Taux d'occupation du système\t\t:${RESTORE}" `df -h | grep -E /$ | cut -d" " -f17`

# L'adresse IP de la machine
echo -e "${GREEN}Adresse IP\t\t\t\t:${RESTORE}" `hostname -I | cut -d" " -f1`

}

FUNC_INFO_SYS(){
#var
GREEN='\033[0;32m'
RESTORE='\033[0m'


#code
echo -e "$GREEN \t\t\t INFORMATIONS SYSTEME $RESTORE" #affiche le titre: INFO SOFTWARE
# Le type de noyau UNIX utilisé sur ce système
echo -e "${GREEN}Version du noyau\t\t\t:${RESTORE}" `uname -sr`


# Le nom de la distribution linux actuelle
echo -e "${GREEN}Distribution linux\t\t\t:${RESTORE}" `cat /etc/os-release | grep PRETTY_NAME | cut -d\" -f2`


# Le nom de l'interpréteur par défaut et sa version
echo -e "${GREEN}Le Shell par défault est\t\t:${RESTORE}" `echo $SHELL | cut -d/ -f3`


# Le nomde l'utilisateur actuel
echo -e "${GREEN}Nom de l'utilisateur en cours\t\t:${RESTORE}" `echo $USER`



}

FUNC_PKG_UPDATE(){ # Choisi le bon manager de paquet en fonction de la distro et propose update

#Var
GREEN='\033[0;32m'
RESTORE='\033[0m'

DIST_FAM=$(cat /etc/os-release | grep "ID_LIKE=" | cut -d= -f2) # Détecte la famille de distribution

#code

if [[ $DIST_FAM == debian ]];then
    apt update
elif [[ $DIST_FAM == fedora ]];then
    dnf update
else 
exit 1
echo -e "${GREEN}Désolé votre distribution appartient à la famille $DIST_FAM et ne peut pas être mise à jour via ce spript, better luck next time!${RESTORE}"

fi

}

FUNC_LIST_USERS(){ #Liste les utilisateur humains du système

echo -e "${GREEN}UTILISATEURS HUMAINS${RESTORE}"
cut -d: -f1,3 /etc/passwd | grep 1... | cut -d: -f1


}



FUNC_ROOT_CHECK(){ #Verifie que l'utilisateur a les privilèges root

#var 
ID=$(id -u) # print only the effective user ID
GREEN='\033[0;32m'
RESTORE='\033[0m'

#Code

if [ $ID != 0 ] #verifie si utilisateur = 0 = root
  then 
    echo -e "${GREEN}Merci d'exécuter en tant que root${RESTORE}" 
    exit 1
fi



}


FUNC_CHECK_CHOIX(){ #Verifie que le choix de l'utilisateur fait partie de 4 choix

if [[ $CHOIX != [1-6] ]];then
  echo -e "$CHOIX ne fait pas partie du menu ci-dessus!"
  exit 1
fi

}

FUNC_SAVE(){
#var
GREEN='\033[0;32m'
RESTORE='\033[0m'
DATE=$(date +%F) #date au format x/x/x

#code
read -p "Merci d'entrer le nom de votre dossier personnel afin de le sauvegarder au format tar.bz2:

" DOSSPERSO

tar -jcf $DOSSPERSO$DATE.tar.bz2 $DOSSPERSO
echo -e "${GREEN}Vous avez sauvegardé $DOSSPERSO sous le nom $DOSSPERSO-$DATE.tar.bz2 ${RESTORE}"
}

FUNC_BANNER(){ #banniere du td ultime
#var
RED='\e[0;31m'
RESTORE='\033[0m'
#code
echo -e "$RED \n\t\t\t LINUX MACHINE MANAGER\n-----------------------------------------------------------------------------------------$RESTORE 
"

}

FUNC_TAIL(){
#var
RED='\e[0;31m'
RESTORE='\033[0m'

#code
echo -e "${RED}\nPour afficher de nouveau les options: appuyez sur \"Entrez\"${RESTORE}"
}




