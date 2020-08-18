################################################################################
##  File:  Install-TypeScript.ps1
##  Desc:  Install Latest TypeScript
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
npm install -g typescript

Invoke-PesterTests -TestFile "Tools" -TestName "Typescript"
