# installed-software-list-in-Windows
List all the installed software in Windows using PowerShell Script

<pre>
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
</pre>
