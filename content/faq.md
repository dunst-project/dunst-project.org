+++
weight = 3
title = "FAQ"
menu = "main"
type = "page"
toc = "true"
+++

# Common problems

## Cannot open display

Dunst was unable to connect to the X server. Make sure that X is running and that the `DISPLAY` environment variable is correctly set.

If you're using the systemd service, that might mean that dbus isn't setting the right variables, see issue [#347](https://github.com/dunst-project/dunst/issues/347) for more details.

## Name Lost. Is Another notification daemon running?

The connection to the dbus daemon failed or another process is using the notification address. Make sure that the `DBUS_SESSION_ADDRESS` environment variable is set and if not you should consult your distributions documentation on how to properly setup dbus.

Additionally, verify that the output of

```
gdbus call --session --dest org.freedesktop.DBus --object-path /org/freedesktop/Dbus --method org.freedesktop.DBus.ListNames
```

Does not contain `org.freedesktop.Notifications`. If it does it means that another notification daemon is already running.

## Icons are too big

Since the 1.2 version release, an option `max_icon_size` was introduced to scale down icons to a certain size. By default this option is set to 0 (it doesn't scale down icons), to change this behaviour you need to set this option in the global section of the config file. For reference, check out the [dunstrc](https://github.com/dunst-project/dunst/blob/master/dunstrc#L159) config example file.


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

# Special usages

## Sending notifications from another user (root)

Your new shell has to be able to execute commands as dunst's user.

```
alias notify-send="sudo -u USERNAME DISPLAY=:0 notify-send"
```

Any other combination, executing `notify-send` with the valid `DISPLAY`-variable and user should work.
