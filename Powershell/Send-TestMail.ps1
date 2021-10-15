# NOTE: Valid email address, password, SMTP server, from and to addresses must all be provided. They are simply placeholders values here for security.

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