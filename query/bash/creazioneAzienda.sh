#!/bin/bash

azienda='{
    "Ragionesociale": "",
    "Partitaiva": "",
    "Indirizzo": "",
    "Comune": "",
    "Provincia": "",
    "Cap": "",
    "Nazione": "",
    "Email": "",
    "Pec": "",
    "Tel": ""
}'

url="http://127.0.0.1:5000/registrazione_azienda"

curl -X POST -d "$azienda" -H "Content-Type: application/json" "$url"