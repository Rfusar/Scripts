#!/bin/bash

documento='{
    "Id": "",
    "Nome_file": "",
    "User": "",
    "System": "",
    "Ragionesociale": ""
}'

url="http://127.0.0.1:5000/registrazione_documento_mutui"

curl -X POST -d "$azienda" -H "Content-Type: application/json" "$url"