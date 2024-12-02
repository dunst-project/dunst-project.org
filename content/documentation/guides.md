+++
title = "Documentation"
type = "documentation"
toc = "true"
subtitle = "Guides"
lastdate = "2024-12-02"
descript = "Guides wiki page"
wiki = true
weight = 3
+++
## Understanding rules

Dunst offers some very powerful configuration options in the form of rules. With
rules you can change the appearance of notifications, hide some notifications
that you don't find useful, change their timeout and much more.

### Example 1: basic rule

There are two kinds of
rules: filtering rules and modifying rules. These are used for matching a
notification and subsequently changing some of it's properties. When no
filtering rules are used, all notifications are matched. So let's look at an
example.

```ini
[change-format]
        appname = dunstify
        format = "<b>%s</b>\n<i>%b</i>"
```

The rules are place in a section with a custom name. This can be any name, but
it should be descriptive of what you want to do. The `appname` is a filtering
rule to match only notifications sent by `dunstify`. `format` is a modifying
rule to change the format of the matched notification. Once you restart dunst,
you should see that all notification sent by `dunstify` will have a different
format. You can test it out by sending a notification: `dunstify "Summary in
bold" "Body in italics"`.


### Example 2: rule without filters

You don't have to add filters to your rules. If you don't add any filters, all
notifications will be matched. This is useful if you want to apply a setting to
all notifications. Below is an example.

```ini
[fullscreen]
        fullscreen = show
```

Now notifications will be shown over fullscreen applications. (Note that on
Wayland the notification layer has to be overlay for this to work. This is set
by default).


### Example 3: rule order matters

Rules are evaluated in order from top to bottom. Any time a notification is
changed, it may affect if it's being matched by a later rule. Let's look at
another example. This time we'll try to change a notification's urgency and make
sure it gets a different appearance based on that.

```ini
# Bad example
[change-appearance]
        match_urgency = critical
        background = "#D62929"
        foreground = "#F9FAF9"

[change-urgency]
        appname = dunstify
        urgency = critical
```

In the above example, all critical notification will get a different appearance
based on their urgency. You might think that the rule that changes the urgency
will make sure the notification's appearance changes as well. But rule order
matter. First the notification's appearance is changed based on it's urgency and
only after that the urgency is changed. Thus the notification's appearance is
unchanged.


```ini
# Good example
[change-urgency]
        appname = dunstify
        urgency = critical

[change-appearance]
        match_urgency = critical
        background = "#D62929"
        foreground = "#F9FAF9"
```

The above example is the right way to do this. First change the urgency and then
change the appearance based on the urgency. Again, you can try this out by
placing it in you dunstrc.

### Special sections

Since dunst v1.7.0, every section will behave like a rule. Still, there are a
few special sections that will limit the kinds of rules you can place there.
This is mostly for backward compatibility. The special sections are `[global]`,
`[urgency_low]`, `[urgency_medium]` and `[urgency_critical]`. Dunst will not
allow you to place filtering rules in these sections, as they are meant to have
specific filters. The `[global]` section will match all notifications, where as
the `[urgency_*]` sections will match their respective urgencies.

There is not much special about these sections, though, as you can do most of
the configuration with normal rules. Only the `[global]` section is truly
special, since all the global configurations options can only be used in this
section.


## Debugging D-bus

When you send a notification using `notify-send` or `dunstify` this information
is sent to dunst over D-Bus. This information can be really useful in debugging
dunst.
To have a look at what is send to dunst over D-Bus, take a look at the output of
the command

`dbus-monitor path=/org/freedesktop/Notifications`

This will tell you every time a notification is sent what the contents are of
that notification and when it is closed again. The D-Bus is really easy to
integrate with your program, so you could create an application that does
something every time a dunst notification is closed.

## Using the progress bar for volume notifications

With [PR 775](https://github.com/dunst-project/dunst/pull/775) merged, dunst has the ability to draw a progress bar under the notification.
This is very useful for brightness or volume notifications. This guide will explain how
to use and customize that progress bar.

First check if your dunst version is recent enough. The current git master or everything
after 1.6.0 should be good.

To test if you can see a progress bar, use this command:

`dunstify "Progress: " -h int:value:60`

This should look something like this

![progress bar](https://user-images.githubusercontent.com/23078054/102403602-cd0ad800-3fe6-11eb-8800-6ed2adf653a5.png)

You can change the 60 for any value you like. To make useful volume notifications you
need a bit more, though. Firstly , the value should be changing with the volume.
Secondly, if you change your volume a few times in a row, you don't want to have multiple
notifications. They should replace each other.

### Using the volume as progress value

To address the first thing, you can simply replace the progress value with a command.

```dunstify "Progress: " -h int:value:"`ponymix get-volume`"```

You can replace ponymix with any volume command that outputs a single value.

### Replacing notifications

Replacing notifications is also very easy. Think of a name for you group of notifications,
like "audio", and use the following command

```dunstify -h string:x-canonical-private-synchronous:audio "Volume: " -h int:value:"`ponymix get-volume`"```

This passes a string named `x-canonical-private-synchronous` with the value `audio` 
to dunst. You can name the string `x-dunst-stack-tag` as well if you find it easier.

### Configuring the progress bar

After making such nice use of the progress bar, you might want to change how it looks.
The settings you want to look at are `highlight`, `progress_bar`, `progress_bar_height`
, `progress_bar_min_width`, `progress_bar_max_width` and `progress_bar_frame_width`.
Most of these settings are self-explanatory, but I'll explain a few of them.

The `highlight` setting changes the colour of the progress bar (and in the future maybe
other similar things). It can be specified per urgency or per notification, not in the
[global] section.

The `progress_bar` setting determines if a progress bar is drawn. Make sure it's set to
true if you want to use it (this is the default).

If you've configured it, it might look something like this

![notification with progress bars](https://user-images.githubusercontent.com/23078054/102542111-98b01e00-40b1-11eb-967e-bc952430bd06.png)

_A progress bar is drawn for every urgency_

If you like it, the config for this can be found [here](https://gitlab.manjaro.org/profiles-and-settings/manjaro-theme-settings/-/blob/master/skel/.config/dunst/dunstrc).

### Conclusion

The above command is very useful, and you could change your window manager config to run
this command every time you hit a hotkey to change your volume. A similar thing could be
done for brightness changes. 

You might run into some trouble, however when the change in
volume or brightness is not yet available to the brightness command. To look at a completely
working example you could use, look at the [progress-notify.sh](https://github.com/dunst-project/dunst/blob/master/contrib/progress-notify.sh) script from the contrib directory.

## Using notification actions

Dunst has support for notification actions, which allow you to immediately react upon receiving a notification without first opening the app. You can for example mark a message as read, or click to view the rest of the email. After a notification is closed, however, the action is also invalidated. In other words, you can't activate the action of a notifications that is pulled from your history.

### Sending notifications with an action

You can send a notification with an action using dunstify:
`dunstify -A yes,ACCEPT -A no,DECLINE "Call waiting"`

The first word after `-A` is the name of the action and the string after the comma is the description.

### Activating an action

There are a two ways you can activate an action:


#### Open the context menu and choose the action
To open the context menu, first add the following to your dunstrc:
```ini
[global]
    mouse_middle_click = context,close_current #close_current is optional
```

After saving that and restarting dunst you can activate the action by middle clicking on it. This will open dmenu (or the dmenu alternative you've configured in your dunstrc) with the different actions you can activate. If you've used the dunstify command from above, you'll see the action you've chosen printed in stdout.

#### Activate it directly

Add the following to your dunstrc:
```ini
[global]
    mouse_middle_click = do_action,close_current #close_current is optional

[all_notifications] # A rule that matches all notifications
    action_name = "no" # Optional, to activate the action "no" automatically
```

If you now middle click on a notification the action is activated directly, if available. Otherwise a context menu is opened as well.