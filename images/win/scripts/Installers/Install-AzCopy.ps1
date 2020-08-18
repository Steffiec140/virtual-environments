################################################################################
##  File:  Install-AzCopy.ps1
##  Desc:  Install AzCopy10
################################################################################

Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp

Choco-Install -PackageName azcopy10

Invoke-PesterTests -TestFile "Tools" -TestName "AzCopy"