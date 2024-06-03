$i = 0
$secpasswd = ConvertTo-SecureString '!!!PasseDeBoiteMail!!!' -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential ("noreply@capza.co",$secpasswd)
$Event = Get-EventLog -LogName Security -InstanceId 4740 -Newest 1

$User = $Event.ReplacementStrings[0]
$Computer = $Event.ReplacementStrings[1]
$Domain = $Event.ReplacementStrings[5]
$Body = "Account Name: " + $Domain + "\" + $User + "`r`n" + "Workstation: " + $Computer + "`r`n" + "Time: " + $Event.TimeGenerated
$Subject = "Account Locked Out: " + $Domain + "\" + $User

Do{
    try{
        Send-MailMessage -From 'noreply@capza.co' -To 'laboite@capza.co' -Subject $subject -body $body -SmtpServer smtp.office365.com -Credential $creds -UseSsl -Port 587 -ErrorAction Stop
        $i = 1;
    }
    catch{
        #Write-Host "An error occurred that could not be resolved."
    }
}Until($i -eq 1)