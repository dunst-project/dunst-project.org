+++
weight = 3
title = "Documentation"
type = "documentation"
toc = "true"
subtitle = "Dependencies"
lastdate = "2024-10-31"
descript = "Dependencies wiki page"
wiki = true
+++
Dunst requires these libraries to compile.

* gio-2.0
* gdk-pixbuf-2.0
* glib-2.0
* pangocairo
* libnotify (optional, for dunstify)
* wayland-client (optional, for wayland)
* wayland-cursor (optional, for wayland)
* x11 (optional, for xorg)
* xinerama (optional, for xorg)
* xext (optional, for xorg)
* xrandr (optional, for xorg)
* xscrnsaver (optional, for xorg)

Additionally, gdk-pixbuf has *librsvg* as an *optional runtime dependency* (for loading svg files).

NOTE: dunstctl uses the *busctl* for displaying rules and history. This command is usually provided by systemd.
In systems without systemd this can be installed with [elogind](https://github.com/elogind/elogind) or [basu](https://sr.ht/~emersion/basu/).

## Arch

Available from the AUR as [dunst-git](https://aur.archlinux.org/packages/dunst-git/)

## Debian and Ubuntu

in general, on Debian and Debian-based distros you'll need also the *-dev packages.

```
libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libgdk-pixbuf-2.0-dev librsvg-2.0
```

#### Optional dunstify dependency
```
apt install libnotify-dev
```


## Outdated sections

**May be no longer relevant!**

### Fedora

```
dbus-devel libX11-devel libXrandr-devel glib2-devel pango-devel gtk3-devel libxdg-basedir-devel libXScrnSaver-devel libnotify-devel
```

### Solus

**Out of date, updates needed:**
Gtk2 was dropped in favour of gtk3

```
libcairo glibc libx11 libxinerama libxdg-basedir pango glib2 libxscrnsaver libxrandr-devel
```
