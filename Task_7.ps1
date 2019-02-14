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