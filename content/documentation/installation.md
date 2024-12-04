+++
title = "Documentation"
type = "documentation"
toc = "true"
subtitle = "Installation"
lastdate = "2024-12-05"
descript = "Installation wiki page"
wiki = true
weight = 2
css = [ "documentation.css" ]
+++
## Install with package manager

Dunst is available in many package repositories. Chances are you can simply install it with your package manager.
If not, don't worry, it's not hard to build it yourself.

You can check the version of Dunst available with your package manager on [Repology](https://repology.org/project/dunst/versions).

### Arch

On Arch linux you can get dunst from the *Extra* repository as [dunst](https://archlinux.org/packages/extra/x86_64/dunst/)
or from the *AUR* as [dunst-git](https://aur.archlinux.org/packages/dunst-git/).

```sh
pacman -S dunst
```

### Debian and Ubuntu

On Debian and derivatives (Ubuntu, Kali, Cinnamon, etc.) you can install Dunst with

```sh
apt install dunst
```

### Gentoo

See the Gentoo [wiki page](https://wiki.gentoo.org/wiki/Dunst).

```sh
emerge --ask --verbose x11-misc/dunst
```

### Void

Dunst is available in the `current` repository.

```sh
xbps-install dunst
```

### Fedora

```sh
dnf install dunst
```

### FreeBSD

You can install directly from the repository with
```sh
pkg install sysutils/dunst
```

Alternatively a [dunst port](https://cgit.freebsd.org/ports/tree/sysutils/dunst) is available in the ports tree.

```sh
cd /usr/ports/sysutils/dunst/
make install clean
```

### NixOS

There is a Nix package available [here](https://mynixos.com/nixpkgs/package/dunst).

## Building it yourself

After you have installed all the [dependencies](./Dependencies) needed, you can build dunst:

```sh
# clone the repository
git clone https://github.com/dunst-project/dunst.git
cd dunst

# compile and install
make
sudo make install
```

On Debian (and derivatives) systems the preferred method to install is to use [checkinstall](https://wiki.debian.org/CheckInstall) instead of `sudo make install`

```sh
PREFIX=/usr checkinstall # Prefix is necessary to systemctl service installation
sudo dpkg -i dunst_*.deb # Install generated .deb
```

### Make parameters

Dunst can be customized by defining environmental variables when invoking make.
The accepted parameters are listed below.

Make sure to run all make calls with the same parameter set.
So when building with `make PREFIX=/usr`, you have to install it with `make PREFIX=/usr install`, too.

| Variable | Values | Default | Description|
|----------|--------|---------|------------|
| **DESTDIR**             |`<PATH>` | `/`               | Set the destination directory of the installation.|
| **PREFIX**              |`<PATH>` | `/usr/local`      | Set the prefix of the installation.|
| **BINDIR**              |`<PATH>` | `${PREFIX}/bin`   | Set the dunst executable's path.|
| **DATADIR**             |`<PATH>` | `${PREFIX}/share` | Set the path for shared files.|
| **BASHCOMPLETIONDIR**   |`<PATH>` | `${DATADIR}/bash-completion/completions` | Set the path for installation of bash completion files. |
| **FISHCOMPLETIONDIR**   |`<PATH>` | `${DATADIR}/fish/vendor_completions.d` | Set the path for installation of fish completion files. |
| **ZSHCOMPLETIONDIR**    |`<PATH>` | `${DATADIR}/zsh/site-functions`| Set the path for installation of zsh completion files. |
| **SYSCONFDIR**          |`<PATH>` | `${PREFIX}/etc/xdg`| Set the base directory for system config files. |
| **SYSCONFFILE**         |`<PATH>` | `${SYSCONFDIR}/dunst/dunstrc`| Set the absolute path to which the default dunstrc shall be installed. |
| **SYSCONF\_FORCE\_NEW** |`[0/1]`  | `0` (don't overwrite) | Overwrite existing `${SYSCONFFILE}`. |
| **MANDIR**              |`<PATH>` | `${DATADIR}/man`| Set the prefix of the manpage. |
| **SYSTEMD**             |`[0/1]`  | _unset_ (autodetect systemd) | Disable/Enable the systemd unit. |
| **WAYLAND**             |`[0/1]`  | `1` (enabled)| Disable/Enable wayland support. |
| **X11**                 |`[0/1]`  | `1` (enabled)| Disable/Enable X11 support. |
| **DUNSTIFY**            |`[0/1]`  | `1` (enabled)| Disable/Enable the libnotify *dunstify* utility. |
| **COMPLETIONS**         |`[0/1]`  | `1` (enabled)| Disable/Enable installation of shell completions. |
| **SERVICEDIR\_SYSTEMD** |`<PATH>` | `${PREFIX}/lib/systemd/user`| The path to put the systemd user service file. Unused, if `SYSTEMD=0`. |
| **SERVICEDIR\_DBUS**    |`<PATH>` | `${DATADIR}/dbus-1/services` | The path to put the dbus service file. |
| **EXTRA\_CFLAGS**       |`<FLAGS>`| _unset_ | Additional flags for the compiler.|


## Optional tools (dunstify)

Dunst comes with it's own program for sending notifications, `dunstify`.
If you installed dunst with a package manager this will probably be installed as well.

You might find it useful, however, to use a standard tool for that job.
If so, install `notify-send`. It can't do everything that dunstify can, but it will work for most things.

If you are building from source dunstify is *enabled by default*.
To build without dunstify set `DUNSTIFY` to `0`.

```sh
# This builds without dunstify
DUNSTIFY=0 make all
DUNSTIFY=0 make install
```