################################################################################
##  File:  Install-GitHub-CLI.ps1
##  Desc:  Install GitHub CLI
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName gh

Add-MachinePathItem "C:\Program Files (x86)\GitHub CLI"

Invoke-PesterTests -TestFile "CLI.Tools" -TestName "GitHub CLI"