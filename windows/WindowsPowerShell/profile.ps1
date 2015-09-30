#FileName: profile.ps1
#Name:     Miguel's humble posh profile
#Purpose:  It's the fucking CurrentUserAllHosts profile
#Date:     30/09/2015
#Author:   Miguel Santos
#Notes:    It gets symlinked in place of $PROFILE.CurrentUserAllHosts


##Aliases

##Variables

New-Variable -Name reqelevated -Value "Elevated shell required! Try running PowerShell with Administrator rights." -Description "Elevated prompt required" -Option ReadOnly -Scope "Global"


##Functions

Function Test-ConsoleHost{
	if(($host.Name -match 'consolehost')) {$true}
	Else {$false}  
}

Function Test-Elevated{

	<#
		.Synopsis
			Tests if the user is an administrator
		.Description
			Returns true if a user is an administrator, false if the user is not an administrator       
		.Example
			Test-Elevated
		#>
	$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
	$principal = New-Object Security.Principal.WindowsPrincipal $identity
	$principal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

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
		get-service spooler | where {$_.status -eq 'stopped'} | stop-service -force
		}
	else{
		Write-Output "$reqelevated"
		}	
}

Function Start-Spooler{

	if(Test-Elevated){
		get-service spooler | where {$_.status -eq 'running'} | start-service -force
		}
	else{
		Write-Output "$reqelevated"
		}
}

