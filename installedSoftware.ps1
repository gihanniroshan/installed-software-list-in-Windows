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
