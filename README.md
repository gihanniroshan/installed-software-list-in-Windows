# installed-software-list-in-Windows
List all the installed software in Windows using PowerShell Script


```powershell
$uninstallKeys = @(
    'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall',
    'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
)

$softwareList = foreach ($uninstallKey in $uninstallKeys) {
    Get-ChildItem -Path $uninstallKey |
        Get-ItemProperty |
        Where-Object { $_.DisplayName -and $_.UninstallString } |
        Select-Object DisplayName, DisplayVersion, Publisher
}

$sortedList = $softwareList | Sort-Object DisplayName

$sortedList | Format-Table -AutoSize
```

Run the above PowerShell Script in; 
1. "Windows PowerShell ISE" or
2. Download the [installedSoftware.ps1](./installedSoftware.ps1) and run using PowerShell
