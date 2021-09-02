# This is a Powershell script. It can be saved as '.ps1' instead of '.txt' and run, but the extension was changed for Outlook's mail filters.
# A valid password needs to be provided as $networkPassword to authenticate. It has been removed here for security.

$networkUsername = 'email@address.tld'
$networkPassword = 'password'

$smtpServer = 'mailserver.url.tld'
$smtpPort = 587
$smtpClient = New-Object Net.Mail.SmtpClient($smtpServer,$smtpPort)

$smtpClient.EnableSsl = $false
$smtpClient.Credentials = New-Object System.Net.NetworkCredential($networkUsername,$networkPassword);

$mailFrom = 'email@address.tld'
$mailTo = 'recipient1@address.tld,recipient2@emailaddress.tld,recipient3@emailaddy.tld'
$mailSubj = 'Test email'
$mailBody = 'This is an external test email.'

$smtpClient.Send($mailFrom, $mailTo, $mailSubj, $mailBody)

Write-Output 'Mail send attempted!'