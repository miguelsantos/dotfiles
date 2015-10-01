#FileName: mutil.ps1
#Name:     Utility Functions
#Purpose:  Holds general utility Functions
#Date:     01/10/2015
#Author:   Miguel Santos
#Notes:


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
