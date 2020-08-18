################################################################################
##  File:  Install-OpenSSL.ps1
##  Desc:  Install OpenSSL
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName openssl.light

Invoke-PesterTests -TestFile "Tools" -TestName "OpenSSL"