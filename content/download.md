+++
weight = 2
title = "Download"
menu = "main"
type = "page"
+++
***

The current stable version of Dunst is **1.2.0** released on **Jul 12 2017**.

# Downloads

* [Source tarball](https://github.com/dunst-project/dunst/archive/v1.2.0.tar.gz)
* [Code repository (Github)](https://github.com/dunst-project/dunst)

# Release Notes

After about 3 years of inactivity, dunst is back under active development.

Version 1.2 is supposed to be fully backwards compatible with 1.1 but due to
the number of changes and the time since the last release there may be some
overlooked breakages. If one is found it should be reported to the bug tracker.

For users:

* Markup

    The `allow_markup` setting has been deprecated in favour of `markup` which
    is a multi-value setting that can be used to control much more accurately
    how markup in notifications should be handled. Currently it only supports
    `no`, `strip` and `full` as values but it is planned to be expanded soon.

    To preserve backwards compatibility, `allow_markup` is still supported but
    users are encouraged to update their configuration files since it will be
    removed after a few major releases.

* DPI handling

    The DPI value used is now retrieved from the `Xft.dpi` X resource if
    available. If not, the default value 96 will be used.

    Additionally, as an experiment a per-monitor dpi setting, which tries to
    calculate an acceptable dpi values for each monitor, has been added to the
    experimental section of the configuration file.

* RandR and Xinerama

    Dunst switched from using the Xinerama extension to provide multi-monitor
    support to using the more modern RandR extension. While this change won't
    affect the majority of users, some legacy drivers do not support RandR. In
    that case, the `force_xinerama` option was added as a way to fall back to
    the old method.

    The downside of forcing Xinerama to be used is that dunst won't be able to
    detect when a monitor is added or removed meaning that follow mode might
    break if the screen layout changes.

* Frame settings

    All the settings in the frame section of the configuration file have been
    deprecated and have been moved into the global section. The `color` and `size`
    settings became `frame_color` and `frame_size` respectively. As with
    `allow_markup`, the old format still works but it'll be removed in one of the
    next major releases.

* Deprecation of urgency-specific command line flags

    The urgency specific command line flags (`-li,-ni,-ci,-lf,-nf,-cf,-lb,
    -nb,-cb,-lfr,-nfr,-cfr,-lto,-nto,-cto`) have been deprecated with no
    plan for a replacement. If you rely on them please respond to issue #328 on
    the bug tracker with your use case.

For maintainers:

* The project homepage has been changed to https://dunst-project.org
* The main repository has been changed to https://github.com/dunst-project/dunst

* Dependency changes:
 - Dependency on libraries that were unused in the code but were mentioned as
   dependencies has been dropped. Dunst no longer depends on: libfreetype,
   libxft and libxext.
 - Added dependency on libxrandr and libgtk2.0.

For a full list of changes see the [changelog](/changelog/).
