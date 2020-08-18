################################################################################
##  File:  Install-Packer.ps1
##  Desc:  Install Packer
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName packer

Invoke-PesterTests -TestFile "Tools" -TestName "Packer"