#FileName: printer.ps1
#Name:     Printer Functions
#Purpose:  Holds printer and spooler related Functions
#Date:     01/10/2015
#Author:   Miguel Santos
#Notes:


##Functions


Function Restart-Spooler
{
	If(Test-Elevated)
	{
		Get-Service spooler | where {$_.status -eq 'running'} | Restart-Service -Force
		Get-Service spooler | where {$_.status -eq 'stopped'} | Start-Service
	}
	Else {Write-Output "$require_elevated"}
}

Function Stop-Spooler
{
	If(Test-Elevated)
	{
		Get-Service spooler | where {$_.status -eq 'running'} | Stop-Service -Force
	}
	Else {Write-Output "$require_elevated"}
}

Function Start-Spooler
{
	If(Test-Elevated)
	{
		Get-Service spooler | where {$_.status -eq 'stopped'} | Start-Service
	}
	Else {Write-Output "$require_elevated"}
}

Function Get-SpoolerStatus
{
	$spooler = Get-Service spooler
	$spoolerstatus = $spooler.status
	Write-Output "$spoolerstatus"
}


Function Set-Spool
	<#
		.SYNOPSIS
			Manages the spool Service
		.DESCRIPTION
			Starts, stops or restarts the spool Service
		.EXAMPLE
			Set-Spool start
			Set-Spool stop
			Set-Spool restart
			Set-Spool status
	#>
{
	Param
	(
		# Command parameter
		[Parameter(Mandatory, Position=0)]
		$Param1
	)
	Begin
	{
		If ($Param1 -eq "start")
		{
			Start-Spooler
		}
		ElseIf ($Param1 -eq "stop")
		{
			Stop-Spooler
		}
		ElseIf ($Param1 -eq "restart")
		{
			Restart-Spooler
		}
		ElseIf ($Param1 -eq "status")
		{
			Get-SpoolerStatus
		}
		Else {Write-Output "Unsupported parameter."}
	}
}
