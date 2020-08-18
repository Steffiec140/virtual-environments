################################################################################
##  File:  Install-InnoSetup.ps1
##  Desc:  Install Inno Setup
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName innosetup

Invoke-PesterTests -TestFile "Tools" -TestName "InnoSetup"