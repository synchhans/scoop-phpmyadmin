param(
    [string]$command = "help",
    [string]$value
)

$ErrorActionPreference = "SilentlyContinue"

$root = "$env:SCOOP\apps\phpmyadmin\current"
$pidFile = "$root\server.pid"
$portFile = "$root\port.txt"

# default port
if (!(Test-Path $portFile)) {
    "8080" | Out-File $portFile
}

$port = Get-Content $portFile
$url = "http://localhost:$port"

function Get-PHP {
    $php = Get-Command php -ErrorAction SilentlyContinue
    if (!$php) {
        Write-Host "PHP not found. Install with: scoop install php" -ForegroundColor Red
        exit
    }
    return $php.Source
}

function Start-Server {

    if (Test-Path $pidFile) {
        Write-Host "phpMyAdmin already running." -ForegroundColor Yellow
        return
    }

    $php = Get-PHP

    Write-Host "Starting phpMyAdmin on $url" -ForegroundColor Green

    $proc = Start-Process `
        -FilePath $php `
        -ArgumentList "-S localhost:$port" `
        -WorkingDirectory $root `
        -PassThru

    $proc.Id | Out-File $pidFile

    Start-Sleep 1
    Start-Process $url
}

function Stop-Server {

    if (!(Test-Path $pidFile)) {
        Write-Host "phpMyAdmin not running." -ForegroundColor Yellow
        return
    }

    $pid = Get-Content $pidFile
    Stop-Process -Id $pid -Force

    Remove-Item $pidFile

    Write-Host "phpMyAdmin stopped." -ForegroundColor Red
}

function Status-Server {

    if (Test-Path $pidFile) {
        $pid = Get-Content $pidFile
        Write-Host "phpMyAdmin running (PID $pid) → $url" -ForegroundColor Green
    }
    else {
        Write-Host "phpMyAdmin not running." -ForegroundColor Yellow
    }
}

function Set-Port($p) {

    if (!$p) {
        Write-Host "Usage: phpmyadmin port 9000"
        return
    }

    $p | Out-File $portFile
    Write-Host "Port set to $p"
}

switch ($command) {

    "start" { Start-Server }

    "stop" { Stop-Server }

    "restart" {
        Stop-Server
        Start-Sleep 1
        Start-Server
    }

    "open" {
        Start-Process $url
    }

    "status" {
        Status-Server
    }

    "port" {
        Set-Port $value
    }

    default {
        Write-Host ""
        Write-Host "phpMyAdmin CLI"
        Write-Host ""
        Write-Host "Commands:"
        Write-Host "  phpmyadmin start        Start server"
        Write-Host "  phpmyadmin stop         Stop server"
        Write-Host "  phpmyadmin restart      Restart server"
        Write-Host "  phpmyadmin status       Server status"
        Write-Host "  phpmyadmin open         Open browser"
        Write-Host "  phpmyadmin port 9000    Change port"
        Write-Host ""
    }
}