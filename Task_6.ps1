#6.	Вывести свободное место на локальных дисках. На каждом и сумму.
$disk=Get-WmiObject -Class win32_logicaldisk -Filter "drivetype=3" |`
 Select-Object DeviceID, Freespace
$disk
$s=$null
foreach ($i in $disk.freespace){
    $s+=$i/1Gb 
}
write-output "total free spase = $s Gb"