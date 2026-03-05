# Scoop phpMyAdmin Bucket

Install **phpMyAdmin** easily on Windows using **Scoop**.

phpMyAdmin is a web-based administration tool for MySQL and MariaDB.

Official website: https://www.phpmyadmin.net/

---

# Requirements

Make sure you already have the following installed:

* Scoop
* PHP
* MySQL or MariaDB

Example:

```powershell
scoop install php
scoop install mysql
```

---

# Add Bucket

Add this repository as a Scoop bucket:

```powershell
scoop bucket add phpmyadmin https://github.com/synchhans/scoop-phpmyadmin
```

---

# Install phpMyAdmin

```powershell
scoop install phpmyadmin
```

Scoop will install phpMyAdmin into:

```
~/scoop/apps/phpmyadmin/current
```

---

# Run phpMyAdmin

Simply run:

```powershell
phpmyadmin
```

This will:

* Start the PHP built-in web server
* Serve the phpMyAdmin directory
* Automatically open your browser

Default URL:

```
http://localhost:8080
```

---

# Configuration

If needed, create a configuration file:

```
config.inc.php
```

Example minimal configuration:

```php
<?php
$cfg['blowfish_secret'] = 'random-secret-key';
$i = 0;
$i++;
$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['auth_type'] = 'cookie';
```

---

# Update phpMyAdmin

Update using Scoop:

```powershell
scoop update phpmyadmin
```

---

# Uninstall

```powershell
scoop uninstall phpmyadmin
```

---

# Repository Structure

```
scoop-phpmyadmin
 ├─ bucket
 │   ├─ phpmyadmin.json
 │   └─ phpmyadmin.ps1
 └─ README.md
```

---

# License

phpMyAdmin is licensed under the GNU General Public License (GPL).

See: https://www.phpmyadmin.net/
