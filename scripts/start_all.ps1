function Get-ScriptDirectory
{
    Split-Path $MyInvocation.ScriptName
}

Write-Host "Startup Server..."
$ServerFolder = Join-Path -Path (get-item (Get-ScriptDirectory)).Parent.FullName -ChildPath "server";
Start-Process powershell -ArgumentList  "aqueduct serve" -WorkingDirectory $ServerFolder;

Write-Host "Started Client,..."
$ClientFolder = Join-Path -Path (get-item (Get-ScriptDirectory)).Parent.FullName -ChildPath "client";
Start-Process powershell -ArgumentList  "webdev serve --auto restart" -WorkingDirectory $ClientFolder;
