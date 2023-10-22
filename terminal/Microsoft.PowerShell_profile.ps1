#Aliases
Set-Alias tt tree
Set-Alias ll ls
Set-Alias g git
Set-Alias vim neovide


#Prompt
oh-my-posh init pwsh --config 'C:/Users/lolme/scoop/apps/oh-my-posh/theme.omp.json' | Invoke-Expression

#Terminal Icons
Import-Module Terminal-Icons

#PSReadLine
Import-Module PSReadLine
Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key 'Ctrl+k' -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key 'Ctrl+n' -Function HistorySearchForward
Set-PSReadLineOption -PredictionViewStyle ListView