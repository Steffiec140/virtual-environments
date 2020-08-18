################################################################################
##  File:  Install-Julia.ps1
##  Desc:  Install Julia
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName julia -ArgumentList "--ia","/DIR=C:\Julia"

Invoke-PesterTests -TestFile "Tools" -TestName "Julia"