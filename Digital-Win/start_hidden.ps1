$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$XmrigPath = Join-Path $ScriptDir "xmrig.exe"
$ConfigPath = Join-Path $ScriptDir "config.json"

$RunDuration = 7200
$SleepDuration = 1800

while ($true) {
    $process = Start-Process -FilePath $XmrigPath `
                             -ArgumentList "-c `"$ConfigPath`"" `
                             -PassThru `
                             -WindowStyle Hidden

    Start-Sleep -Seconds $RunDuration

    if (!$process.HasExited) {
        Stop-Process -Id $process.Id -Force
    }

    Start-Sleep -Seconds $SleepDuration
}