#!/bin/bash
cd ..

firefox https://hub.docker.com
read

clear
git clone git@github.com:Rfusar/dashboard.git

#ELIMINA
cp -r dashboard dashboard_immagine
cd dashboard_immagine
rm .env
rm -rdf .git
cd ..

#COPIA
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

#FASE PULIZIA
clear
sudo docker rm web_page
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
