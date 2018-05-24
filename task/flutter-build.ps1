[CmdletBinding()]
param(
    # Source Foolder
    [string]
    [parameter(mandatory=$true)]
    $sourceFolder,

    # Target Folder
    [string]
    [parameter(mandatory=$false)]
    $targetFolder,

    # arguments
    [parameter(mandatory=$false)]
    [string]
    $arguments,

    # determine whether to run the Flutter build command with the --debug flag
    [parameter(mandatory=$false)]
    [string]
    [ValidateSet('true', 'false', 'yes', 'no')]
    $runDebug = 'false'

    # determine whether to run Flutter Test before running Flutter build
    [parameter(mandatory=$false)]
    [string]
    [ValidateSet('true', 'false', 'yes', 'no')]
    $runTests = 'false'

    # determine whether to clean the folder before downloading the flutter runtime or not
    [parameter(mandatory=$false)]
    [string]
    [ValidateSet('true', 'false', 'yes', 'no')]
    $Clean = 'false'
)

try
    {
    Write-Host "----------------------------------------------------"
    Write-Host "Run Flutter commands"

    Write-Host "Add Flutter to environment path"
    $env:path=  "$env:path;$(Build.GitDirectory)\Flutter\bin"

    Write-Host "Run Flutter doctor"
    Flutter doctor -v

    Write-Host "Navigate to Flutter Project root:"
    cd $(system.defaultworkingdirectory)

    Write-Host "Build apk"
    Flutter build apk -v

    Write-Host "----------------------------------------------------"
    Write-Host "Completed running Flutter commands"
}
finally
{
    $script:ErrorActionPreference = $backupErrorActionPreference

    Set-Location "$CurrentDirectory"
}

