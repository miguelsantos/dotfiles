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

Set-Alias -Name dotfiles -Value Edit-Dotfiles

##Variables

New-Variable -Name require_elevated -Value "Elevated shell required! Try running PowerShell with Administrator rights." -Description "Elevated prompt required" -Option ReadOnly -Scope "Global"
New-Variable -Name dot_files_dir -Value "$HOME\dotfiles" -Description "dotfiles location" -Option ReadOnly -Scope "Global"

##Functions

Function Edit-Dotfiles{
	& atom $dot_files_dir
}
