# Disable the firewall for Domain, Public, and Private profiles
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# Download and install Chrome Remote Desktop Host
$CRDPath = "$env:TEMP\chromeremotedesktophost.msi"
Invoke-WebRequest 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' -OutFile $CRDPath
Start-Process $CRDPath -Wait
Remove-Item $CRDPath

# Download and install Google Chrome
$ChromePath = "$env:TEMP\chrome_installer.exe"
Invoke-WebRequest 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $ChromePath
Start-Process -FilePath $ChromePath -ArgumentList '/silent', '/install' -Verb RunAs -Wait
Remove-Item $ChromePath
