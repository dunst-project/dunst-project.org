+++
weight = 2
title = "Download"
menu = "main"
type = "page"
+++

The current stable version of Dunst is **1.13.1** released on **January 23 2026**.

* <i class="fa fa-github" aria-hidden="true"></i> [Github repository](https://github.com/dunst-project/dunst)

* <i class="fa fa-archive" aria-hidden="true"></i> [Source tarball](https://github.com/dunst-project/dunst/archive/v1.13.1.tar.gz)

# Release Notes For v1.13.0
***

Since the last release there have been many contributions. While most of the
changes were "behind the scenes", there are still some new features.

### For users:
With the new `remove_current` action, you will be able to close and directly remove
from history a notification.
Now you can set a pause level at startup with the `default_pause_level` setting.
The Wayland support has seen several improvements (special thanks to @pslldq).

### For maintainers:
Meson build system was added alongside the existing Makefile.
While support for make will be kept for future releases, we might eventually
transitioning fully to the new system.
Meson support is still considered *experimental* and may still have issues.

Take a look at the [changelog]({{< ref "/changelog#v1.13.1" >}} "Changelog") for all the bug fixes and improvements.

