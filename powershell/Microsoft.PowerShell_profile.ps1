Set-Alias -Name v -Value nvim

function Get-CmdletAlias ($cmdletname) {
  Get-Alias |
    Where-Object -FilterScript {$_.Definition -like "$cmdletname"} |
      Format-Table -Property Definition, Name -AutoSize
}

$PSReadLineOptions = @{
	EditMode                      = "Vi"
	HistoryNoDuplicates           = $false
	HistorySearchCursorMovesToEnd = $true
}
Set-PSReadLineOption @PSReadLineOptions

Import-Module -Name Terminal-Icons

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\robbyrussel.omp.json" | Invoke-Expression
