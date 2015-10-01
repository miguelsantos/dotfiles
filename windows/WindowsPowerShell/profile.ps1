#FileName: profile.ps1
#Name:     Miguel's humble posh profile
#Purpose:  It's the fucking CurrentUserAllHosts profile
#Date:     30/09/2015
#Author:   Miguel Santos
#Notes:    It gets symlinked in place of $PROFILE.CurrentUserAllHosts


##Imports
##Note: Imports are now handled by the module mecanism of posh

#. .\printer.ps1
#. .\util.ps1


##Aliases


##Variables

New-Variable -Name reqelevated -Value "Elevated shell required! Try running PowerShell with Administrator rights." -Description "Elevated prompt required" -Option ReadOnly -Scope "Global"


##Functions
