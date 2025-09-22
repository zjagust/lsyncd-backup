# lsyncd-backup-package

A Debian packaging repository that installs a curated `lsyncd` configuration, helper scripts, and a systemd drop-in to manage local/remote backup syncs.  

The package depends on **lsyncd** and provides configuration files, include lists, and helper tooling so a minimal server setup is ready to run after package install.

## Features
- Installs `lsyncd` configuration (`/etc/lsyncd/lsyncd.conf.lua`).
- Installs modular include files under `/etc/lsyncd/includes/`.
- Installs a helper script (`/usr/local/bin/lsyncd-merge-includes`) to merge include files into a single list for `rsync`.
- Adds a systemd drop-in (`/etc/systemd/system/lsyncd.service.d/override.conf`) to ensure include merging before service start.
- Provides Debian packaging metadata so CI/CD can build a `.deb` package automatically.

## Quickstart
```bash
git clone https://github.com/zjagust/lsyncd-backup-package.git
cd lsyncd-backup-package
```

### Build the package localy (optional)
```bash
sudo apt update
sudo apt install -y build-essential devscripts debhelper dpkg-dev
dpkg-buildpackage -us -uc
```

### Install the package
```bash
sudo apt install ../lsyncd-backup_0.1.0_all.deb
```

## License
Distributed under the MIT License. See [LICENSE](license) for details.
