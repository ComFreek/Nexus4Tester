$regName = "Nexus4Tester";
$regValue = "powershell.exe -WindowStyle hidden -File `"" + [string]$PSScriptRoot + "\soldout.ps1`"";

$autoStartLoc = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run";

function Create-AutoStart {
    Push-Location;
    Set-Location $autoStartLoc;
    Set-ItemProperty . -Name $regName -Value $regValue;
    Pop-Location;
}

function Remove-AutoStart {
    Push-Location;
    Set-Location $autoStartLoc;
    Remove-ItemProperty . -Name $regName -ErrorAction SilentlyContinue;
    Pop-Location;
}