+++
weight = 2
title = "Download"
menu = "main"
type = "page"
+++
***

The current stable version of Dunst is **1.7.3** released on **Dec 8 2021**.

# Downloads

* [Source tarball](https://github.com/dunst-project/dunst/archive/v1.7.3.tar.gz)
* [Code repository (Github)](https://github.com/dunst-project/dunst)

# Release Notes for v1.7.0

This release was long overdue. There have been a lot of changes in the mean
time. For a full list of changes, see the changelog.

For users:

The wayland support of v1.6.0 was already pretty good, but this release added
fullscreen detection and improved the stability.

This release added a few improvements to the wayland support. Dunst now
automatically falls back to X11 when the wayland compositor doesn't support the
neccesary protocols.

For maintainers:

Previously the readme said dunst depended on GTK3, which hasn't been the case
for a while. Make sure that GTK3 is not included as a dependency.

The default program for opening URL's in notifications has been changed from
firefox to xdg-open.

The Makefile and dunstrc searching has been significantly changed to be more
compliant with the XDG spec. The default config directory, `SYSCONFDIR`, has
been changed from "/etc" to "${PREFIX}/etc/xdg/". To change back to the old
behaviour, run make with: `make SYSCONFDIR="/etc"` (make sure to pass the same
variables to make in subsequent calls). Take a look at the "Make parameters"
section of the readme and the FILES section of the man page for more details.
