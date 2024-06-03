#Install-Module NTFSSecurity
#[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Set-Location "D:\SCAN"
$Folders = Import-Csv D:\SCAN\FormatUserDirScan.csv
ForEach ($Folder in $Folders) {
    $Compte =  $Folder.UserPrincipalName
	Get-Item $Folder.Name | Disable-NTFSAccessInheritance
	Remove-NTFSAccess –Path $Folder.Name  –Account "Utilisateurs" -AccessRights FullControl
    Add-NTFSAccess –Path $Folder.Name  –Account $Compte –AccessRights Modify
    Write-Output $Folder.Name     
} 