################################################################################
##  File:  Install-R.ps1
##  Desc:  Install R for Windows
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install R.Project
Choco-Install rtools

$rscriptPath = Resolve-Path "C:\Program Files\R\*\bin\x64"
Add-MachinePathItem $rscriptPath
Invoke-PesterTests -TestFile "Tools" -TestName "R"