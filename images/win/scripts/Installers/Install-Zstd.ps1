################################################################################
##  File:  Install-zstd.ps1
##  Desc:  Install zstd
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName zstandard

Invoke-PesterTests -TestFile "Tools" -TestName "Zstd"
