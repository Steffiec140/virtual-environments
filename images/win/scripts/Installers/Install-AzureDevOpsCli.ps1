################################################################################
##  File:  Install-AzureDevOpsCli.ps1
##  Desc:  Install Azure DevOps CLI
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp

az extension add -n azure-devops

Invoke-PesterTests -TestFile "CLI.Tools" -TestName "Azure DevOps CLI"