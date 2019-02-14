#1.	Вывести список всех классов WMI на локальном компьютере. 
Get-wmiObject -list * 


#2.	Получить список всех пространств имён классов WMI. 
Get-WmiObject -Class __namespace -Namespace root 


#3.	Получить список классов работы с принтером.
Get-WmiObject  -List "*printer*" 


#4.	Вывести информацию об операционной системе, не менее 10 полей.
Get-WmiObject Win32_OperatingSystem | select status, version, bootdevice, `
Currenttimezone, localdatetime, freephysicalmemory, installdate, csname,` producttype,    SystemDrive


#5.	Получить информацию о BIOS.
Get-WmiObject win32_bios | format-list *


#6.	Вывести свободное место на локальных дисках. На каждом и сумму.
$disk=Get-WmiObject -Class win32_logicaldisk -Filter "drivetype=3" |`
 Select-Object DeviceID, Freespace
$disk
$s=$null
foreach ($i in $disk.freespace){
    $s+=$i/1Gb 
}
write-output "total free spase = $s Gb"


#7.Написать сценарий, выводящий суммарное время пингования компьютера (например 10.0.0.1) в сети.
[CmdletBinding()]
Param
	(
[parameter(Mandatory=$true)]
[string]$IP
    )
$Totaltime = $null
Get-WmiObject Win32_PingStatus -Filter "Address='$IP'" |`
ForEach-Object{
    $Totaltime += $_.ResponseTime
}
if ($Totaltime -ne $null)
{
Write-Host "TotalTime = " $Totaltime 
}
else {Write-Output "IP doesn't exist in your network!"}

#8.	Создать файл-сценарий вывода списка установленных программных продуктов 
#в виде таблицы с полями Имя и Версия.
Get-WmiObject win32_product | Select-Object name, version


#9.	Выводить сообщение при каждом запуске приложения MS Word.
register-wmiEvent -query "select * from __instancecreationevent within 5 
where targetinstance isa 'Win32_Process' and targetinstance.name='WINWORD.exe'" `
-sourceIdentifier "ProcessStarted" -Action { Write-Host "Process WINWORD.exe was run" } 






