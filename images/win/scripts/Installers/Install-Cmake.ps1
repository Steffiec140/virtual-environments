################################################################################
##  File:  Install-Cmake.ps1
##  Desc:  Install Cmake
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName cmake.install -ArgumentList "--installargs",'ADD_CMAKE_TO_PATH=""System""'

Invoke-PesterTests -TestFile "Tools" -TestName "CMake"