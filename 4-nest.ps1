<#
.SYNOPSIS
An example of how to next commands.

.DESCRIPTION
USAGE
    .\4-nest.ps1 <command>

COMMANDS
    speak       speak some text
    logs        view logs
#>
param(
    [Parameter(Position=0)]
    [ValidateSet("logs")]
    [string]$Command,

    [Parameter(Position=1, ValueFromRemainingArguments=$true)]
    $Rest
)

if (!$Command) {
    Get-Help $PSCommandPath
    exit
}

function Command-Logs {
<#
.SYNOPSIS
Show logs for an application.

.DESCRIPTION
USAGE
    .\4-nest.ps1 logs <command>

COMMANDS
    app-one     show logs for app-one
    app-two     show logs for app-two
#>
    param(
        [Parameter(Position=0)]
        [ValidateSet("", "app-one", "app-two")]
        [string]$App
    )

    if (!$App) {
        Get-Help Command-Logs
        exit
    }

    Write-Host "Showing logs for " -N
    Write-Host $App -F Green
}

switch ($Command) {
    "speak" { Command-Speak $Rest }
    "logs"  { Command-Logs $Rest }
}