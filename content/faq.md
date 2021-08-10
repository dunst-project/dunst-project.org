+++
weight = 3
title = "FAQ"
menu = "main"
type = "page"
toc = "true"
+++

# Common problems

## Errors about missing or failing to open a display

Depending on the setup dunst was unable to connect to the X server or the wayland compositor in use. In case of X make sure that X is running and that the `DISPLAY` environment variable is correctly set. For a wayland based setup the `WAYLAND_DISPLAY` environment variable needs to be set to a valid value.

If dunst should be automatically started by dbus or via the systemd service, it is important to know that both don't inherit environment variables set by a shell.
There are various ways to make them aware if they're missing.  
For a X based setup either use `systemctl --user import-environment DISPLAY` or add a call to `/etc/X11/xinit/xinitrc.d/50-systemd-user.sh` in xinitrc.  
With a wayland setup `systemctl --user import-environment WAYLAND_DISPLAY` would be used instead.  
If systemd knows about those environment variables, dbus should too.
But if there are still issues with the dbus session then `dbus-update-activation-environment --systemd --all` can be used to update the current session.

## Cannot connect to DBus

Dunst cannot connect to your session bus at all. The session bus might not even exist.

Please check all these conditions:

- dbus packages are really installed
- dbus is running
- The env variable `DBUS_SESSION_BUS_ADDRESS` is really set

## Cannot acquire 'org.freedesktop.Notifications'

Another notification daemon is already running, which is listening for notifications. Usually this is another daemon, which got autostarted or is dunst itself.

Usually, dunst also prints the PID of this process, which will give you more possibilities to investigate. Maybe you want to simply `kill` this PID and then start dunst.

## Name Lost. Is Another notification daemon running?

The connection to the dbus daemon failed or another process is using the notification address. Make sure that the `DBUS_SESSION_BUS_ADDRESS` environment variable is set and if not you should consult your distributions documentation on how to properly setup dbus.

Additionally, verify that the output of

```
gdbus call --session --dest org.freedesktop.DBus --object-path /org/freedesktop/Dbus --method org.freedesktop.DBus.ListNames
```

Does not contain `org.freedesktop.Notifications`. If it does it means that another notification daemon is already running.

## Icons are too big

Since the 1.2 version release, an option `max_icon_size` was introduced to scale down icons to a certain size. By default this option is set to 0 (it doesn't scale down icons), to change this behaviour you need to set this option in the global section of the config file. For reference, check out the [dunstrc](https://github.com/dunst-project/dunst/blob/master/dunstrc#L159) config example file.

## How to switch back to notify-osd?

D-Bus does not know which notification daemon it should start. So it decides arbitrarily which one to use.

You have to link the D-Bus service file of your preferred notification daemon into your home folder.

To change the notification daemon back to the default, open up a shell and execute these two commands:

```
mkdir -p "${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services"
ln -sfT \
    "/usr/share/dbus-1/services/${SERVICE:-org.freedesktop.Notifications}.service" \
    "${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services/org.freedesktop.Notifications.service"
```

If you want to switch back to dunst again, first define `SERVICE=org.knopwob.dunst` and re-execute the `ln` command.

For more info, see the discussion in [#363](https://github.com/dunst-project/dunst/issues/363).

# Mouse operations

## Clicking on a notification with a message like "click here" does nothing

Regular left click on dunst is assigned to the action "close the notification" by default. To invoke the default action for the notification, please try middle click or executing a command line `dunstctl action` via a custom keyboard shortcut instead.

If you like the behavior similar to the one on other platforms like Windows (regular left click to invoke the default action), setting [the option `mouse_left_click` in the dunstrc](https://github.com/dunst-project/dunst/blob/732227eff5df7afa3f44bc7f2cc661b22b4e3f0b/dunstrc#L273) to `do_action, close_current` will help you.

# Special usages

## Sending notifications from another user (root)

Your new shell has to be able to execute commands as dunst's user and you have to export the `DBUS_SESSION_BUS_ADDRESS` environment variable with the same content it would have in your desktop session.

Usually, the environment variable's content is `DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/<UID>/bus`. On older systems, this may not be the case and may change on a per-session basis.

```
alias notify-send="sudo -u USERNAME DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/<UID>/bus notify-send"
```

Any other combination, executing `notify-send` with the valid `DBUS_SESSION_BUS_ADDRESS`-variable and user should work.
