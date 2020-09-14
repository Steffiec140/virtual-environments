param (
    [Parameter(Mandatory)][string]
    $OutputDirectory
)

# Install MarkdownPS module for software report generation
Install-Module MarkdownPS -Force -Scope CurrentUser
Import-Module MarkdownPS

$markdown = ""

$markdown += New-MDHeader "Ubuntu" -Level 1

$markdown += New-MDList -Style Unordered -Lines @(
    "Image Version: $env:ImageVersion"
)


$markdown | Out-File -FilePath "${OutputDirectory}/Ubuntu-Readme.md"
