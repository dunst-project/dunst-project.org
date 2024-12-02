+++
title = "Documentation"
type = "documentation"
toc = "true"
subtitle = "Dependencies"
lastdate = "2024-12-02"
descript = "Dependencies wiki page"
wiki = true
weight = 1
css = [ "documentation.css" ]
+++
Dunst requires these libraries to compile.

* [`gdk-pixbuf-2.0`](https://repology.org/project/gdk-pixbuf/versions)
* [`glib-2.0`](https://repology.org/project/glib/versions)
* `gio-2.0`
* `pangocairo` (provided by [pango](https://repology.org/project/pango/versions) + [cairo](https://repology.org/project/cairo-graphics-library/versions))
* [`libnotify`](https://repology.org/project/libnotify/versions) (optional, for *dunstify*)
* [`wayland-client`](https://repology.org/project/wayland/versions) (optional, for *wayland*)
* `wayland-cursor` (optional, for *wayland*)
* [`x11`](https://repology.org/project/xorg-server/versions) (optional, for *xorg*)
* [`xinerama`](https://repology.org/project/libxinerama/versions) (optional, for *xorg*)
* [`xext`](https://repology.org/project/libxext/versions) (optional, for *xorg*)
* [`xrandr`](https://repology.org/project/libxrandr/versions) (optional, for *xorg*)
* [`xscrnsaver`](https://repology.org/project/libxscrnsaver/versions) (optional, for *xorg*)

Additionally, `gdk-pixbuf` has `librsvg` as an **optional runtime dependency** (for loading svg files).

NOTE: dunstctl uses `busctl` for displaying rules and history. This command is *usually* provided by systemd.
In systems without systemd this can be installed with [elogind](https://github.com/elogind/elogind) or [basu](https://sr.ht/~emersion/basu/).

## Arch

Available from the AUR as [dunst-git](https://aur.archlinux.org/packages/dunst-git/)

## Debian and Ubuntu

In general, on Debian and Debian-based distros (and many other binary based distros) you'll need also the `*-dev` packages.

```sh
apt install libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev \
    libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libgdk-pixbuf-2.0-dev librsvg-2.0
```

### Optional dunstify dependency

```sh
apt install libnotify-dev
```
