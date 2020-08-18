################################################################################
##  File:  Install-Mercurial.ps1
##  Desc:  Install Mercurial
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName hg -ArgumentList "--version", "5.0.0"

$hgPath = "${env:ProgramFiles}\Mercurial\"
Add-MachinePathItem $hgPath
$env:Path = Get-MachinePath

Invoke-PesterTests -TestFile "Tools" -TestName "Mercurial"