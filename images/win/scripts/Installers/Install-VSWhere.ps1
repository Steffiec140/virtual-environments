################################################################################
##  File:  Install-VSWhere.ps1
##  Desc:  Install latest stable version of VSWhere
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName vswhere

Invoke-PesterTests -TestFile "Tools" -TestName "VSWhere"
