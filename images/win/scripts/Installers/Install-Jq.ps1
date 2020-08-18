################################################################################
##  File:  Install-Jq.ps1
##  Desc:  Install jq
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName jq

Invoke-PesterTests -TestFile "Tools" -TestName "Jq"