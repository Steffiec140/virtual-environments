####################################################################################
##  File:  Install-AzureCosmosDbEmulator.ps1
##  Desc:  Install Azure CosmosDb Emulator
####################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp

Import-Module -Name ImageHelpers -Force

$InstallerName = "AzureCosmosDBEmulator.msi"
$InstallerUrl = "https://aka.ms/cosmosdb-emulator"

Install-Binary -Url $InstallerUrl -Name $InstallerName

Invoke-PesterTests -TestFile "Tools" -TestName "Azure Cosmos DB Emulator"