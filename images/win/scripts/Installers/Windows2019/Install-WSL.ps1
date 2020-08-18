################################################################################
##  File:  Install-WSL.ps1
##  Desc:  Install Windows Subsystem for Linux
################################################################################

Write-Host "Install Windows Subsystem for Linux"

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart

Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp