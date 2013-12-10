$outlook = New-Object -com Outlook.Application
$inbox = $outlook.Session.GetDefaultFolder(6)
$stream = [System.IO.StreamWriter] "d:\blink-new-mail-temp.txt"
if ($inbox.UnReadItemCount -eq 0) { $stream.WriteLine("#000000") }
$stream.WriteLine("pattern: ""NewMail""")
$stream.close()