$documento = @{
    Id = ""
    Nome_file = ""
    User = ""
    System = ""
    Ragionesociale = ""
}

$jsondoc = $documento | ConvertTo-Json

$url = "127.0.0.1:5000/registrazione_documento_mutui"

Invoke-RestMethod -Uri $url -Method Post -Body $jsondoc -ContentType "application/json"