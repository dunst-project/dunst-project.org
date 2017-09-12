+++
weight = 3
title = "FAQ"
menu = "main"
type = "page"
+++

## How to switch back to notify-osd?

D-Bus does not know know, which notification daemon it should start. So it decides arbitary, which one to use.

You have to link the D-Bus service file of your preferred notification daemon into your homefolder.

To change the notification daemon back to the default, use open up a shell and execute those two commands:

```
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services"
ln -sfT \
    "/usr/share/dbus-1/services/${SERVICE:-org.freedesktop.Notifications}.service" \
    "${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services/org.freedesktop.Notifications.service"
```

If you want to switch back to dunst again, first define `SERVICE=org.knopwob.dunst` and reexecute the `ln`-command.

For more info, see the discussion in [#363](https://github.com/dunst-project/dunst/issues/363).
