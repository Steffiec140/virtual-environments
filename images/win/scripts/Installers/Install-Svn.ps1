################################################################################
##  File:  Install-Svn.ps1
##  Desc:  Install Subversion
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName tortoisesvn

Invoke-PesterTests -TestFile "Tools" -TestName "Svn"
