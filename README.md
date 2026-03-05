# Scoop phpMyAdmin Bucket

This repository provides a Scoop bucket for installing **phpMyAdmin** easily on Windows.

phpMyAdmin is a free and open-source web-based administration tool for MySQL and MariaDB.

Official website: https://www.phpmyadmin.net/

---

## Requirements

Before installing phpMyAdmin, make sure the following are installed:

* PHP
* MySQL / MariaDB
* Scoop

Example installation:

```powershell
scoop install php
scoop install mysql
```

---

## Add this bucket

Run the following command:

```powershell
scoop bucket add phpmyadmin https://github.com/synchhans/scoop-phpmyadmin
```

---

## Install phpMyAdmin

```powershell
scoop install phpmyadmin
```

After installation, phpMyAdmin will be located in:

```
~/scoop/apps/phpmyadmin/current
```

---

## Running phpMyAdmin

Navigate to the installation directory and start the PHP built-in server:

```powershell
cd ~/scoop/apps/phpmyadmin/current
php -S localhost:8080
```

Then open your browser:

```
http://localhost:8080
```

---

## Configuration

Rename the sample configuration file:

```
config.sample.inc.php
```

to:

```
config.inc.php
```

Then edit it and set a secret key:

```php
$cfg['blowfish_secret'] = 'your-secret-key';
```

---

## Updating

To update phpMyAdmin via Scoop:

```powershell
scoop update phpmyadmin
```

---

## Uninstall

```powershell
scoop uninstall phpmyadmin
```

---

## License

phpMyAdmin is licensed under the GNU General Public License (GPL).

See: https://www.phpmyadmin.net/
