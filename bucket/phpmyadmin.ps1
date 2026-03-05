$dir = "$env:USERPROFILE\scoop\apps\phpmyadmin\current"

Write-Host "Starting phpMyAdmin server..."
Start-Process "http://localhost:8080"

php -S localhost:8080 -t $dir