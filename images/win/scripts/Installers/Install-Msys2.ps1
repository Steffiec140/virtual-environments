################################################################################
##  File:  Install-Msys2.ps1
##  Desc:  Install Msys2 and 64 & 32 bit gcc, cmake, & llvm
################################################################################

# References
# https://github.com/msys2/MINGW-packages/blob/master/azure-pipelines.yml
# https://packages.msys2.org/group/

$dash = "-" * 40

# Downloading msys2
$msys2Release = "https://api.github.com/repos/msys2/msys2-installer/releases/latest"
$msys2Uri = ((Invoke-RestMethod $msys2Release).assets | Where-Object {
  $_.name -match "x86_64" -and $_.name.EndsWith("tar.xz") }).browser_download_url
$msys2File = Start-DownloadWithRetry -Url $msys2Uri

# extract tar.xz to C:\
Write-Host "Starting msys2 extraction"
$tempPath = Join-Path $env:Temp msys
Extract-7Zip -Path $msys2File -DestinationPath $tempPath
$tarPath = Resolve-Path $tempPath\msys*.tar
Extract-7Zip -Path $tarPath -DestinationPath C:\
Write-Host "Finished extraction"

# Add msys2 bin tools folders to PATH temporary
$env:PATH = "C:\msys64\mingw64\bin;C:\msys64\usr\bin;$env:PATH"

Write-Host "`n$dash bash pacman-key --init"
bash.exe -c "pacman-key --init 2>&1"

Write-Host "bash pacman-key --populate msys2"
bash.exe -c "pacman-key --populate msys2 2>&1"

Write-Host "`n$dash pacman --noconfirm -Syyuu"
pacman.exe -Syyuu --noconfirm
taskkill /f /fi "MODULES eq msys-2.0.dll"
Write-Host "`n$dash pacman --noconfirm -Syuu (2nd pass)"
pacman.exe -Syuu  --noconfirm
taskkill /f /fi "MODULES eq msys-2.0.dll"

Write-Host "`n$dash Install msys2 packages"
pacman.exe -S --noconfirm --needed --noprogressbar base-devel compression
taskkill /f /fi "MODULES eq msys-2.0.dll"

Write-Host "`n$dash Remove p7zip/7z package due to conflicts"
pacman.exe -R --noconfirm --noprogressbar p7zip

# mingw package list
$tools64 = "___clang ___clang-tools-extra ___cmake ___llvm  ___toolchain ___ragel"
$tools32 = "___clang ___cmake ___llvm  ___toolchain ___ragel"

# install mingw64 packages
Write-Host "`n$dash Install mingw64 packages"
$pre = "mingw-w64-x86_64-"
pacman.exe -S --noconfirm --needed --noprogressbar $tools64.replace('___', $pre).split(' ')

# install mingw32 packages
Write-Host "`n$dash Install mingw32 packages"
$pre = "mingw-w64-i686-"
pacman.exe -S --noconfirm --needed --noprogressbar $tools32.replace('___', $pre).split(' ')

# clean all packages to decrease image size
Write-Host "`n$dash Clean packages"
pacman.exe -Scc --noconfirm

Write-Host "`n$dash Installed mingw64 packages"
pacman.exe -Q | grep ^mingw-w64-x86_64-

Write-Host "`n$dash Installed mingw32 packages"
pacman.exe -Q | grep ^mingw-w64-i686-

Write-Host "`n$dash Installed msys2 packages"
pacman.exe -Q | grep -v ^mingw-w64-

Write-Host "`nMSYS2 installation completed"

Add-MachinePathItem "C:\msys64\mingw64\bin"
Add-MachinePathItem "C:\msys64\usr\bin"

Invoke-PesterTests -TestFile "MSYS2"
