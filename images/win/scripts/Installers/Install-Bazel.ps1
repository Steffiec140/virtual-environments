################################################################################
##  File:  Install-Bazel.ps1
##  Desc:  Install Bazel and Bazelisk (A user-friendly launcher for Bazel)
################################################################################

Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp

Choco-Install -PackageName bazel

npm install -g @bazel/bazelisk

Invoke-PesterTests -TestFile "Tools" -TestName "Bazel"