+++
weight = 2
title = "Download"
menu = "main"
type = "page"
+++
***

The current stable version of Dunst is **1.4.1** released on **Jul 03 2019**.

# Downloads

* [Source tarball](https://github.com/dunst-project/dunst/archive/v1.4.1.tar.gz)
* [Code repository (Github)](https://github.com/dunst-project/dunst)

# Release Notes

## v1.4.1

This is a bugfix only release see the [changelog](/changelog/) for details.

## v1.4.0

There has been significant internal refactoring since the last release which
might have introduced some new bugs. Be sure to report anything you find.
However, as usual, there has been a lot of bug-fixing and a lot of new features
have been added as well. Look at the [full changelog](/changelog/) for a breakdown.
Some important points to note:

For users:

* Behavioural changes

    In the previous release we introduced support for clients to mark
    notifications as 'transient'. Transient notifications used to 1) bypass
    idle_threshold and 2) not be saved in history.
    The latter behaviour has been disabled by default and can be re-created using
    rules if necessary. Transient notifications will now only bypass
    idle_threshold.

    Additionally, to be compliant with the notification spec, the notification
    summary no longer accepts markup.

For maintainers:

* Dependency on libxdg-basedir has been removed


