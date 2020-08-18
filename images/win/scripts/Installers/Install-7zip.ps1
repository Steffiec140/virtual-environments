################################################################################
##  File:  Install-7zip.ps1
##  Desc:  Install 7zip
################################################################################

Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp

Choco-Install -PackageName 7zip.install

Invoke-PesterTests -TestFile "Tools" -TestName "7-Zip"