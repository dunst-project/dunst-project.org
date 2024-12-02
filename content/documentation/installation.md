+++
title = "Documentation"
type = "documentation"
toc = "true"
subtitle = "Installation"
lastdate = "2024-12-02"
descript = "Installation wiki page"
wiki = true
weight = 2
css = [ "documentation.css" ]
+++
## Install with package manager

Dunst is available in many package repositories. Chances are you can simply install it with your package manager.
If not, don't worry, it's not hard to build it yourself.

You can check the version of Dunst available with your package manager on [Repology](https://repology.org/project/dunst/versions).

### Optional tools

Dunst comes with it's own script for sending notifications, `dunstify`. This will probably be installed together with dunst. You might find it useful, however, to use a standard tool for that job. If so, install `notify-send`. It can't do everything that dunstify can, but it will work for most things.

## Building it yourself

After you have installed all the [dependencies](Dependencies) needed, you can build dunst:

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
sudo dpkg -i dunst_*_amd64.deb # Install generated .deb
```

### Optional dunstify binary

Dunstify is enabled by default. To build without dunstify set `DUNSTIFY` to `0`.

```sh
# This builds without dunstify
DUNSTIFY=0 make all
```

Dunstify is then install by `make install` (given that it was not disabled).