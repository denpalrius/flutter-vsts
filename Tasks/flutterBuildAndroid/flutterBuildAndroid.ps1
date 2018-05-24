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

    # determine whether to clean the folder before downloading the flutter runtime or not
    [parameter(mandatory=$false)]
    [string]
    [ValidateSet('true', 'false', 'yes', 'no')]
    $Clean = 'false'
)

        Write-Host "sourceFolder: $sourceFolder"
        Write-Host "targetFolder: $targetFolder"
        Write-Host "arguments: $arguments"
        Write-Host "runDebug: $runDebug"
        Write-Host "Clean: $Clean"
