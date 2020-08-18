####################################################################################
##  File:  Install-WinAppDriver.ps1
##  Desc:  Install Windows Application Driver (WinAppDriver)
####################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Import-Module -Name ImageHelpers -Force

$InstallerName = "WindowsApplicationDriver.msi"
$InstallerUrl = "https://github.com/Microsoft/WinAppDriver/releases/download/v1.1/${InstallerName}"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Install-Binary -Url $InstallerUrl -Name $InstallerName

Invoke-PesterTests -TestFile "WinAppDriver"
