#4.	Вывести информацию об операционной системе, не менее 10 полей.
Get-WmiObject Win32_OperatingSystem | select status, version, bootdevice, `
Currenttimezone, localdatetime, freephysicalmemory, installdate, csname,` producttype,    SystemDrive
