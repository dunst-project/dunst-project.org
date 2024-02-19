+++
weight = 2
title = "Download"
menu = "main"
type = "page"
+++
***

The current stable version of Dunst is **1.10.0** released on **Februari 19 2024**.

# Downloads

* [Source tarball](https://github.com/dunst-project/dunst/archive/v1.10.0.tar.gz)
* [Code repository (Github)](https://github.com/dunst-project/dunst)

===================================================================================
Release Notes For v1.10.0
===================================================================================

It's been a while since the last release. That does not mean that the
development has been stagnent. There are some long requested features have been
implemented, like a do not disturb mode in the form of multiple pause levels.
You can specify the priority of notification and selectively pause them. The
progress bar rendering for low progress values has been fixed, with preparation
work being done for more progress bar customization.

Since dunst gained Wayland support, Wayland received a lot of development.
Dunst needed to do some catchup for that. A new Wayland idle protocol is
implemented and support for Wayland touch screens and multi-seat has been
added. It's now also possible to specify displays by their port name, instead
of number.

Take a look at the changelog for all the bug fixes and improvements.

