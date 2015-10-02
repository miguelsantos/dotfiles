#FileName: printer.ps1
#Name:     Printer Functions
#Purpose:  Holds printer and spooler related Functions
#Date:     01/10/2015
#Author:   Miguel Santos
#Notes:


##Functions


Function Restart-Spooler {

	if(Test-Elevated){
		Get-Service spooler | where {$_.status -eq 'running'} | Restart-Service -Force
		Get-Service spooler | where {$_.status -eq 'stopped'} | Start-Service -Force
		}
	else{
		Write-Output "$require_elevated"
		}
}

Function Stop-Spooler{

	if(Test-Elevated){
		Get-Service spooler | where {$_.status -eq 'running'} | Stop-Service -Force
		}
	else{
		Write-Output "$require_elevated"
		}
}

Function Start-Spooler{

	if(Test-Elevated){
		Get-Service spooler | where {$_.status -eq 'stopped'} | Start-Service -Force
		}
	else{
		Write-Output "$require_elevated"
		}
}
