################################################################################
##  File:  Install-GitVersion.ps1
##  Desc:  Install GitVersion
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName gitversion.portable

Invoke-PesterTests -TestFile "Git" -TestName "GitVersion"
