####################################################################################
##  File:  Install-MongoDB.ps1
##  Desc:  Install MongoDB
####################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName mongodb
$mongoPath = (Get-CimInstance Win32_Service -Filter "Name LIKE 'mongodb'").PathName
$mongoBin = Split-Path -Path $mongoPath.split('"')[1]
Add-MachinePathItem "$mongoBin"

Invoke-PesterTests -TestFile "Databases" -TestName "MongoDB"