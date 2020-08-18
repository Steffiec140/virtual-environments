################################################################################
##  File:  Install-PowershellCore.ps1
##  Desc:  Install PowerShell Core
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Invoke-Expression "& { $(Invoke-RestMethod https://aka.ms/install-powershell.ps1) } -UseMSI -Quiet"

Invoke-PesterTests -TestFile "Tools" -TestName "PowerShell Core"
