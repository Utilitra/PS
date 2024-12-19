# Install Windows Updates, restart Qualys, then force a Qualys scan
Install-Module PSWindowsUpdate -Force
shutdown /a
shutdown /r /t 36000
Import-Module PSWindowsUpdate
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned -Force
Import-Module PSWindowsUpdate
Install-WindowsUpdate -MicrosoftUpdate -AcceptAll
Set-ItemProperty -Path "HKLM:\SOFTWARE\Qualys\QualysAgent\ScanOnDemand\Vulnerability" -Name "ScanOnDemand" -Value "1"
Restart-Service -name QualysAgent
