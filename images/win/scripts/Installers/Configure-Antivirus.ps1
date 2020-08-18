Write-Host "Display ports"
netsh int ipv4 show dynamicport tcp

Write-Host "Set antivirus parameters"
Set-MpPreference -ScanAvgCPULoadFactor 5 -ExclusionPath "D:\", "C:\"