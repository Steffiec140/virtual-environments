################################################################################
##  File:  Install-KubernetesCli.ps1
##  Desc:  Install KubernetesCli
################################################################################
Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp
Choco-Install -PackageName kubernetes-cli
Choco-Install -PackageName minikube

Invoke-PesterTests -TestFile "Tools" -TestName "KubernetesCli"