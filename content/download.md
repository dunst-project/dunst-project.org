+++
weight = 2
title = "Download"
menu = "main"
type = "page"
+++
***

The current stable version of Dunst is **1.11.0** released on **April 15 2024**.

# Downloads

* [Source tarball](https://github.com/dunst-project/dunst/archive/v1.11.0.tar.gz)
* [Code repository (Github)](https://github.com/dunst-project/dunst)

# Release Notes For v1.11.0
***

This release hopefully marks the start of a new period of active development and
contributions and a shift away from the previous lower maintenance mode.

For users:

This is the perfect time to engage with the project and other dunst users.
Some of the features and changes to include in the v2 release are starting to
be proposed or implemented. Everyone's opinion is important, so feel free
to participate in the issues proposing new features (or redesigns of the old ones).

This version mainly contains bug fixes and QoL improvements, and can be considered
a preparatory release for the various things that will come in the future
(overhaul of the rule syntax, multiple windows support, aesthetic and customization
options, refactor of the drawing system, etc).

For maintainers:

X11 support is now optional and can be disabled in build by setting the `X11` make
flag to 0. This means that you can offer Wayland-only builds.

Shell completions are now considered official and can be installed/uninstalled from
the Makefile. By default they are installed and can be disabled by setting the
`COMPLETIONS` flag to 0.

Take a look at the [changelog]({{< ref "/changelog" >}} "Changelog") for all the bug fixes and improvements.

