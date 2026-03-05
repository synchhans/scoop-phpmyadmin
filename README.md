# scoop-phpmyadmin

Install **phpMyAdmin** easily using **Scoop** on Windows.

This repository provides a custom Scoop bucket that installs phpMyAdmin and adds a convenient CLI command to manage the built-in PHP server.

---

# Features

* Install phpMyAdmin using Scoop
* Simple CLI commands
* Built-in PHP development server
* Start / stop phpMyAdmin easily
* Customizable port
* Automatically opens browser

---

# Requirements

Before installing phpMyAdmin, make sure you have:

* Windows
* Scoop installed
* PHP installed

Install PHP if you don't have it yet:

```powershell
scoop install php
```

---

# Installation

Add this bucket:

```powershell
scoop bucket add phpmyadmin https://github.com/synchhans/scoop-phpmyadmin
```

Then install phpMyAdmin:

```powershell
scoop install phpmyadmin
```

---

# Usage

After installation, you can control phpMyAdmin using the CLI.

## Start phpMyAdmin

```powershell
phpmyadmin start
```

Server will run at:

```
http://localhost:8080
```

---

## Stop phpMyAdmin

```powershell
phpmyadmin stop
```

---

## Restart phpMyAdmin

```powershell
phpmyadmin restart
```

---

## Check server status

```powershell
phpmyadmin status
```

Example output:

```
phpMyAdmin running (PID 12345) → http://localhost:8080
```

---

## Open phpMyAdmin in browser

```powershell
phpmyadmin open
```

---

## Change port

Example:

```powershell
phpmyadmin port 9000
```

Then restart server:

```powershell
phpmyadmin restart
```

Now phpMyAdmin will run at:

```
http://localhost:9000
```

---

# Scoop Bucket Structure

```
scoop-phpmyadmin
│
├─ bucket
│   └─ phpmyadmin.json
│
├─ bin
│   └─ phpmyadmin.ps1
│
└─ README.md
```

---

# Updating phpMyAdmin

To update phpMyAdmin version:

1. Edit:

```
bucket/phpmyadmin.json
```

2. Change version and download URL.

3. Update the hash.

You can generate the hash with:

```powershell
scoop hash phpMyAdmin-x.x.x-all-languages.zip
```

---

# Uninstall

```powershell
scoop uninstall phpmyadmin
```

---

# Troubleshooting

## PHP not found

Install PHP first:

```powershell
scoop install php
```

---

## Port already in use

Change the port:

```powershell
phpmyadmin port 9000
phpmyadmin restart
```

---

# About phpMyAdmin

phpMyAdmin is a free software tool written in PHP, intended to handle the administration of MySQL over the Web.

Website:

https://www.phpmyadmin.net/

---

# License

phpMyAdmin is licensed under the **GPL-2.0 License**.

This bucket only distributes the official phpMyAdmin release.

---

# Contributing

Pull requests are welcome.

If you find bugs or want to improve the bucket, feel free to open an issue.

---

# Author

Created for easier phpMyAdmin installation on Windows using Scoop.