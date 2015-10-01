#FileName: printer.ps1
#Name:     Printer Functions
#Purpose:  Holds printer and spooler related Functions
#Date:     01/10/2015
#Author:   Miguel Santos
#Notes:


##Functions


Function Restart-Spooler {

	if(Test-Elevated){
		get-service spooler | where {$_.status -eq 'running'} | restart-service -force
		}
	else{
		Write-Output "$reqelevated"
		}
}

Function Stop-Spooler{

	if(Test-Elevated){
		get-service spooler | where {$_.status -eq 'running'} | stop-service -force
		}
	else{
		Write-Output "$reqelevated"
		}
}

Function Start-Spooler{

	if(Test-Elevated){
		get-service spooler | where {$_.status -eq 'stopped'} | start-service -force
		}
	else{
		Write-Output "$reqelevated"
		}
}
