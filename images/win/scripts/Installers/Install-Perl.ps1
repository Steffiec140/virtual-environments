################################################################################
##  File:  Install-Perl.ps1
##  Desc:  Install Perl
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName strawberryperl

Invoke-PesterTests -TestFile "Tools" -TestName "Perl"