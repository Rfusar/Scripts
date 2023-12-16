#!/bin/bash

#NEL CASO CANCELLI L'IMMAGINE
var1=true
while $var; do
    clear
    read -p "Devi gestire le immagini da  dockerHUB? [Y/N] " risposta
    if [ "$risposta" = "Y" ]; then
    	firefox https://hub.docker.com
	read
	var=false
    elif [ "$risposta" = "N" ]; then
	var=false 
    fi
done

clear
git clone git@github.com:Rfusar/dashboard.git


#DECISIONE DEL BRANCH
branch=true
while $branch; do
    clear
    read -p "Quale branch vuoi utilizzare? " risposta
    if [ "$risposta" = "DashboardVersatile" ]; then
	branch=false
    elif [ "$risposta" = "Repository_GDPR" ]; then
	cd dashboard 
	git checkout Repository_GDPR
	git branch -d DashboardVersatile
	cd ..
	branch=false 
    fi
done


#PREPARAZIONE ALL'IMMAGINE
cp -r dashboard dashboard_immagine
cd dashboard_immagine
rm .env
rm -rdf .git
cd ..

cp .env dashboard_immagine
cp Dockerfile dashboard_immagine


#CREAZIONE IMMAGINE
sudo docker login
cd dashboard_immagine
sudo docker build -t rfusaro12276/web_page:latest .
cd ..


#TEST
sudo docker start psql
sudo docker run --name web_page rfusaro12276/web_page:latest


#ELIMINAZIONE DELLE CARTELLE
clear
sudo docker stop psql
rm -rfd dashboard
rm -rfd dashboard_immagine

#CARCAMENTO SU DOCKER HUB
var=true
while $var; do
    clear
    read -p "CARICO SU DOCKER HUB [Y/N]: " risposta
    if [ "$risposta" = "Y" ]; then 
        sudo docker push rfusaro12276/web_page:latest
        var=false

    elif [ "$risposta" = "N" ]; then
        clear
        var=false	
    fi
done
