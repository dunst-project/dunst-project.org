+++
weight = 2
title = "Download"
menu = "main"
type = "page"
+++
***

The current stable version of Dunst is **1.5.0** released on **Jul 23 2020**.

# Downloads

* [Source tarball](https://github.com/dunst-project/dunst/archive/v1.5.0.tar.gz)
* [Code repository (Github)](https://github.com/dunst-project/dunst)

# Release Notes

For users:

The most important update from the previous version is the addition of the
dunstctl command and dunstify utility, a drop-in notify-send replacement (which
existed for a while, but wasn't installed by default).
The internal keyboard shortcut support in dunst is now considered deprecated
and should be replaced by dunstctl calls. You can use the configuration of your
WM or DE to bind these to shortcuts of your choice.

Additionally, another long requested feature implemented is RGBA/transparency
support. Given an active compositor you can now add an optional transparency
component to all colors in #RRGGBBAA format.

For maintainers:

As mentioned above, two new binaries are now installed by default, dunstctl and dunstify.
libnotify has been added as a dependency as it's used internally by dunstify.


