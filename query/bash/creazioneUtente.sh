#!/bin/bash

utente='{
    "Nome": "",
    "Cognome": "",
    "Tel": "",
    "Ragionesociale": "",
    "Email": "",
    "Password": "",
    "Ruolo": ""
}'

url="http://127.0.0.1:5000/registrazione_utente"

curl -X POST -d "$utente" -H "Content-Type: application/json" "$url"