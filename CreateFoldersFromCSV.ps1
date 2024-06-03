Set-Location "D:\SCAN"
$Folders = Import-Csv D:\SCAN\FormatUserDirScan.csv 
ForEach ($Folder in $Folders) { 
	New-Item $Folder.Name -type directory
	Write-Output $Folder.Name
} 