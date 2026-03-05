param(
    [string]$action = "start"
)

$dir = "$env:USERPROFILE\scoop\apps\phpmyadmin\current"
$port = 8080
$pidFile = "$dir\phpmyadmin.pid"

function Start-PhpMyAdmin {
    if (Test-Path $pidFile) {
        Write-Host "phpMyAdmin already running."
        return
    }

    Write-Host "Starting phpMyAdmin on http://localhost:$port"

    $proc = Start-Process php `
        "-S localhost:$port -t `"$dir`"" `
        -PassThru -WindowStyle Hidden

    $proc.Id | Out-File $pidFile

    Start-Process "http://localhost:$port"
}

function Stop-PhpMyAdmin {
    if (!(Test-Path $pidFile)) {
        Write-Host "phpMyAdmin is not running."
        return
    }

    $pid = Get-Content $pidFile
    Stop-Process -Id $pid -Force

    Remove-Item $pidFile

    Write-Host "phpMyAdmin stopped."
}

function Status-PhpMyAdmin {
    if (Test-Path $pidFile) {
        Write-Host "phpMyAdmin is running."
    } else {
        Write-Host "phpMyAdmin is not running."
    }
}

switch ($action) {
    "start" { Start-PhpMyAdmin }
    "stop" { Stop-PhpMyAdmin }
    "status" { Status-PhpMyAdmin }
    default {
        Write-Host "Usage:"
        Write-Host "  phpmyadmin start"
        Write-Host "  phpmyadmin stop"
        Write-Host "  phpmyadmin status"
    }
}