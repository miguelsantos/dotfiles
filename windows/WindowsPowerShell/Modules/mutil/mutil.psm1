#FileName: mutil.ps1
#Name:     Utility Functions
#Purpose:  Holds general utility Functions
#Date:     01/10/2015
#Author:   Miguel Santos
#Notes:


##Functions

Function Test-ConsoleHost
{
	If(($host.Name -match 'consolehost')) {$true}
	Else {$false}
}

Function Test-Elevated
{
	<#
		.Synopsis
			Tests if the user is an administrator
		.Description
			Returns true If a user is an administrator, false If the user is not an administrator
		.Example
			Test-Elevated
		#>
	$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
	$principal = New-Object Security.Principal.WindowsPrincipal $identity
	$principal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
