$outlook = New-Object -com Outlook.Application
$inbox = $outlook.Session.GetDefaultFolder(6)
$stream = New-Object 'System.IO.StreamWriter' -ArgumentList "d:\blink-new-mail-temp.txt", $false
if ($inbox.UnReadItemCount -eq 0) { 
    $stream.WriteLine("#000000") 
} else {
    $stream.WriteLine("pattern: ""NewMail""")
}
$stream.close()