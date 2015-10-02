#FileName: printer.ps1
#Name:     Printer Functions
#Purpose:  Holds printer and spooler related Functions
#Date:     01/10/2015
#Author:   Miguel Santos
#Notes:


##Variables

New-Variable -Name require_elevated -Value "This command requires an elevated prompt! Try running PwerShell with an Administrator account." -Description "Elevated prompt required" -Option ReadOnly -Scope "Global"


##Functions

Function Restart-Spooler
{
	If (Test-Elevated)
	{
		Get-Service spooler | where {$_.status -eq 'running'} | Restart-Service -Force
		Get-Service spooler | where {$_.status -eq 'stopped'} | Start-Service
	}
	Else {Write-Output "$require_elevated"}
}

Function Stop-Spooler
{
	If (Test-Elevated)
	{
		Get-Service spooler | where {$_.status -eq 'running'} | Stop-Service -Force
	}
	Else {Write-Output "$require_elevated"}
}

Function Start-Spooler
{
	If (Test-Elevated)
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

Function Clear-Spooler
{
	If (Test-Elevated)
	{
		Stop-Spooler
		Remove-Item $SYSTEMROOT\system32\spool\PRINTERS\* -recurse
		Start-Spooler
	}
	Else {Write-Output "$require_elevated"}
}

Function Set-Spooler
	<#
		.SYNOPSIS
			Manages the spool Service
		.DESCRIPTION
			Starts, stops, restarts, shows the status or clears the queue of the spooler Service
		.EXAMPLE
			Set-Spooler start
			Set-Spooler stop
			Set-Spooler restart
			Set-Spooler status
			Set-Spooler clear
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
		ElseIf ($Param1 -eq "clear")
		{
			Clear-Spooler
		}
		Else {Write-Output "Unsupported parameter."}
	}
}
