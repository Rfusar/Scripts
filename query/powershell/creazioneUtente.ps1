$utente = @{
    Nome = ""
    Cognome = ""
    Tel = ""
    Ragionesociale = ""
    Email = ""
    Password = ""
    Ruolo=""
}

$jsonUtente = $utente | ConvertTo-Json

$url = "127.0.0.1:5000/registrazione_utente"
Invoke-RestMethod -Uri $url -Method Post -Body $jsonUtente -ContentType "application/json"