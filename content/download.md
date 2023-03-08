+++
weight = 2
title = "Download"
menu = "main"
type = "page"
+++
***

The current stable version of Dunst is **1.9.1** released on **March 8 2023**.

# Downloads

* [Source tarball](https://github.com/dunst-project/dunst/archive/v1.9.1.tar.gz)
* [Code repository (Github)](https://github.com/dunst-project/dunst)

# Release Notes For v1.8.0

Lots of exciting and useful features are being added to dunst, all while making
dunst even more configurable and reliable.

For users:

This release re-adds the keyboard shortcuts for those who have been missing
them. Also, support for drop-in files has been implemented. Files placed in
dunstrc.d/\*.conf will be read after the main dunstrc. This may be useful for
theming (with pywal or otherwise). In the future we will add example drop-in
files for different default themes and special configuration.

For maintainers:

Not much has been changed for maintainers. Maybe you'll find the drop-in files
useful for distro-specific fixes. Note that only the files in the directory of
the used dunstrc will be read (see dunst(1) for documentation).
