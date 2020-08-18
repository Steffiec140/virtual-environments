################################################################################
##  File:  Install-WebPI.ps1
##  Desc:  Install WebPlatformInstaller
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
# Download and install WebPlatformInstaller
$webPlatformInstallerFile = "WebPlatformInstaller_x64_en-US.msi"
$webPlatformInstallerUrl = "http://go.microsoft.com/fwlink/?LinkId=287166"
Install-Binary -Url $webPlatformInstallerUrl -Name $webPlatformInstallerFile -ArgumentList ("/silent", "/install")

Invoke-PesterTests -TestFile "Tools" -TestName "WebPlatformInstaller"