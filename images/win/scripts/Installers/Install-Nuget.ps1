################################################################################
##  File:  Install-Nuget.ps1
##  Desc:  Install NuGet.CommandLine
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName NuGet.CommandLine

Invoke-PesterTests -TestFile "Tools" -TestName "Nuget"