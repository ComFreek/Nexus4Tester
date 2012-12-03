[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms");

. ".\autostart.ps1";
Create-AutoStart;


$uri = "https://play.google.com/store/devices/details?id=nexus_4_16gb";
$destination =  [IO.Path]::GetTempFileName();

$wc = New-Object System.Net.WebClient;
$wc.DownloadFile($uri, $destination);

$contents = Get-Content $destination;
$matches = $contents -match "hardware-sold-out";

if ($matches.Count -gt 0) {
    [void] [System.Windows.Forms.MessageBox]::Show("Nexus 4 16GB is still sold out!", "Not available :(", 0, [System.Windows.Forms.MessageBoxIcon]::Stop);
}
else {
    $answer = [System.Windows.Forms.MessageBox]::Show("Nexus 4 16GB is AVAILABLE!!`nWebsite will be opened if you close this message box.", "Available :)", 1, [System.Windows.Forms.MessageBoxIcon]::Information);
    if ($answer -eq [System.Windows.Forms.DialogResult]::OK) {
        Start-Process -FilePath $uri;
    }
}