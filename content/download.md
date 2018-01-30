+++
weight = 2
title = "Download"
menu = "main"
type = "page"
+++
***

The current stable version of Dunst is **1.3.1** released on **Jan 30 2018**.

# Downloads

* [Source tarball](https://github.com/dunst-project/dunst/archive/v1.3.1.tar.gz)
* [Code repository (Github)](https://github.com/dunst-project/dunst)

# Release Notes

Version 1.3.1 addresses a race condition that can cause the service file to be
empty upon installation. It contains no other changes, refer to the release
notes for 1.3 bellow for more info on 1.3.

---

Version 1.3 is supposed to be fully backwards compatible with 1.2.

For users:

* Behavioural changes

    Dunst respects the timeout with millisecond accuracy now. Notifications with
    a one second timeout are not shown up to three seconds.
    Additionally you can specify timeout values in milliseconds, seconds, minutes,
    hours or days using the ms, s, h, or d suffix in the config value
    respectively.

    Transient notifications time out ignoring the `idle_threshold` setting and are not
    saved in history. This can be overridden with a rule containing `set_transient = no`.
    In the same vein there is the `match_transient` condition to match transient
    notifications via rules.

    A prefixed tilde (`~/`) in path settings (browser, dmenu, script) is interpreted as the
    home folder of the user.

* Configuration Options

    `icon_folders` got deprecated and renamed to `icon_path`. `icon_folders` is still
    supported, but will get removed in future.

    The option `ellipsize` got introduced. It controls where to ellipsize the text of
    an overlong notification if `word_wrap=no`.

For maintainers:

* Dependencies

    The GTK3+ dependency got removed. Instead of this gdk-pixbuf is required
    explicitly. This had been a transient dependency before.

    In the Makefile, libxrandr is now specified to require version 1.5 or newer.
    The dependency on libxrandr >= 1.5 is not new, Dunst 1.2.0 required it too
    but there was no active check for it.

* Installation process

    The internals of dunst's make installation process have slightly changed. The
    install routine won't install the service files for DBus and systemd in a hardcoded
    subdirectory of $PREFIX. It'll now query the `dbus-1` and `systemd` pkg-config
    packages for those paths and will put it there.

    To overwrite the pkg-config values, you can manually specify another path.
    Use `SERVICEDIR_(DBUS|SYSTEMD)` vars as parameters to your make calls.

    For all introduced variables, see [the README](https://github.com/dunst-project/dunst/blob/v1.3.0/README.md).

* Portability

    GNU-specific functions have been disabled to make dunst portable to nongnu libc's.

For a full list of changes see [CHANGELOG](/changelog/).
