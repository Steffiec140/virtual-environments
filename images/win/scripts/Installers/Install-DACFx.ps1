####################################################################################
##  File:  Install-DACFx.ps1
##  Desc:  Install SQL Server® Data-Tier Application Framework (DACFx) for Windows
####################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Import-Module -Name ImageHelpers -Force

$InstallerName = "DacFramework.msi"
$InstallerUrl = "https://go.microsoft.com/fwlink/?linkid=2128142"

Install-Binary -Url $InstallerUrl -Name $InstallerName

Invoke-PesterTests -TestFile "Tools" -TestName "DACFx"