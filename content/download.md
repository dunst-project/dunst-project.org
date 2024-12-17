+++
weight = 2
title = "Download"
menu = "main"
type = "page"
+++

The current stable version of Dunst is **1.12.1** released on **December 17 2024**.

* <i class="fa fa-github" aria-hidden="true"></i> [Github repository](https://github.com/dunst-project/dunst)

* <i class="fa fa-archive" aria-hidden="true"></i> [Source tarball](https://github.com/dunst-project/dunst/archive/v1.12.1.tar.gz)

# Release Notes For v1.12.0
***

There have been many important contributions in the last few months.
Some notable changes are: adding hot-reload for the configuration, exporting
rules via dunstctl, adding color gradients, removing default hard-coded icons.
For detailed information consult the changelog.

Important notice for all users:

The behaviour of the setting `height` has been changed in a breaking way.
Before you could specify a single value that would be used as the max height
of a notification. In this release the dynamic height was implemented to make
this settings behave more similarly to `width`.
Now the values accepted are either a single number (for a *fixed height*) or
a tuple of numbers (for a min/max range).

The way of specifying a maximum height before was:
```
    height = 300
```

The equivalent way now is:
```
    height = (0, 300)
```

Furthermore the preferred syntax for the `offset` settings has been changed
from NxN to (N,N). The old syntax is supported nevertheless.

If you are a maintainer it would be helpful to include the message above when
an user updates from an older version of dunst.

Take a look at the [changelog]({{< ref "/changelog#v1.12.0" >}} "Changelog") for all the bug fixes and improvements.

