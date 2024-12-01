+++
weight = 3
title = "Documentation"
type = "page"
toc = "true"

+++

[`dunst(5)`]({{< ref "/documentation" >}} "Dunstrc documentation")
[`dunst(1)`]({{< ref "/documentation/dunst" >}} "Dunst documentation")
[`dunstctl(1)`]({{< ref "/documentation/dunstctl" >}} "Dunstctl documentation")

***

# **dunst(1)** <div class="flabel">**2024-07-15**</div>

<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>dunstctl - Command line control utility for dunst, a customizable and lightweight notification-daemon</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rev="made" href="mailto:root@localhost" />
</head>

<body>



<ul id="index">
  <li><a href="#NAME">NAME</a></li>
  <li><a href="#SYNOPSIS">SYNOPSIS</a></li>
  <li><a href="#COMMANDS">COMMANDS</a></li>
</ul>

<h1 id="NAME">NAME</h1>

<p>dunstctl - Command line control utility for dunst, a customizable and lightweight notification-daemon</p>

<h1 id="SYNOPSIS">SYNOPSIS</h1>

<p>dunstctl COMMAND [PARAMETER]</p>

<h1 id="COMMANDS">COMMANDS</h1>

<dl>

<dt id="action-notification_position"><b>action</b> notification_position</dt>
<dd>

<p>Performs the default action or, if not available, opens the context menu of the notification at the given position (starting count at the top, first notification being 0).</p>

</dd>
<dt id="close-ID"><b>close</b> [ID]</dt>
<dd>

<p>Close the topmost notification currently being displayed. You can optionally pass an ID to close the matching notification (if present).</p>

</dd>
<dt id="close-all"><b>close-all</b></dt>
<dd>

<p>Close all notifications currently being displayed.</p>

</dd>
<dt id="context"><b>context</b></dt>
<dd>

<p>Open the context menu, presenting all available actions and urls for the currently open notifications.</p>

</dd>
<dt id="count-displayed-history-waiting"><b>count</b> [displayed/history/waiting]</dt>
<dd>

<p>Returns the number of displayed, shown and waiting notifications. If no argument is provided, everything will be printed.</p>

</dd>
<dt id="history"><b>history</b></dt>
<dd>

<p>Exports the history as JSON.</p>

</dd>
<dt id="history-clear"><b>history-clear</b></dt>
<dd>

<p>Deletes all notifications from the history.</p>

</dd>
<dt id="history-pop-ID"><b>history-pop</b> [ID]</dt>
<dd>

<p>Redisplay the notification that was most recently closed. This can be called multiple times to show older notifications, up to the history limit configured in dunst. You can optionally pass an ID to history-pop, in which case the notification with the given ID will be shown.</p>

</dd>
<dt id="history-rm-ID"><b>history-rm</b> ID</dt>
<dd>

<p>Removes the notification with the given ID from the history.</p>

</dd>
<dt id="is-paused"><b>is-paused</b></dt>
<dd>

<p>Check if dunst is currently running or paused. If dunst is paused notifications will be kept but not shown until it is unpaused.</p>

</dd>
<dt id="set-paused-true-false-toggle"><b>set-paused</b> true/false/toggle</dt>
<dd>

<p>Set the paused status of dunst. If false, dunst is running normally, if true, dunst is paused (with maximum pause level of 100). See the is-paused command and the dunst man page for more information.</p>

</dd>
<dt id="get-pause-level"><b>get-pause-level</b></dt>
<dd>

<p>Get current dunst&#39;s pause level, where 0 is not paused and 100 is maximally paused.</p>

<p>This can be combined with notification&#39;s override_pause_level to selectively display specific notifications while paused.</p>

</dd>
<dt id="set-pause-level-level"><b>set-pause-level</b> [level]</dt>
<dd>

<p>Set the pause level, where 0 is not paused and 100 is maximally paused.</p>

<p>This can be combined with notification&#39;s override_pause_level to selectively display specific notifications while paused.</p>

</dd>
<dt id="rule-rule_name-enable-disable-toggle"><b>rule</b> rule_name enable/disable/toggle</dt>
<dd>

<p>Enables, disables or toggles the rule identified by its name. This can be used to temporarily activate or deactivate specific rules.</p>

</dd>
<dt id="rules---json"><b>rules</b> [--json]</dt>
<dd>

<p>Exports all currently configured rules (optionally JSON formatted).</p>

</dd>
<dt id="reload-dunstrc"><b>reload</b> [dunstrc ...]</dt>
<dd>

<p>Reload the settings of the running dunst instance. You can optionally specify which configuration files to use. Otherwise, the config specified by the first invocation of dunst will be reloaded. When dunst is reloaded all the rules are reapplied to the original notification, so modifications made by previous rules are not taken into account.</p>

</dd>
<dt id="debug"><b>debug</b></dt>
<dd>

<p>Tries to contact dunst and checks for common faults between dunstctl and dunst. Useful if something isn&#39;t working.</p>

</dd>
<dt id="help"><b>help</b></dt>
<dd>

<p>Show all available commands with a brief description.</p>

</dd>
</dl>


</body>

</html>


