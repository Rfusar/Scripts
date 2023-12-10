$azienda = @{
    Ragionesociale = ""
    Partitaiva = ""
    Indirizzo = ""
    Comune = ""
    Provincia = ""
    Cap = ""
    Nazione = ""
    Email = ""
    Pec = ""
    Tel = "" 
}

$jsonAzienda = $azienda | ConvertTo-Json

$url = "127.0.0.1:5000/registrazione_azienda"
Invoke-RestMethod -Uri $url -Method Post -Body $jsonAzienda -ContentType "application/json"