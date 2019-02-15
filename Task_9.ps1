#9.	Выводить сообщение при каждом запуске приложения MS Word.
register-wmiEvent -query "select * from __instancecreationevent within 5 where targetinstance isa 'Win32_Process' and targetinstance.name='WINWORD.exe'" `
-sourceIdentifier "ProcessStarted" -Action { Write-Host "Process WINWORD.exe was run" } 

# Get-EventSubscriber | Unregister-Event





