+++
title = "Documentation"
type = "documentation"
toc = "true"
subtitle = "dunstify(1)"
lastdate = "2024-12-03"
descript = "Dunstify manual page"
wiki = false
css = [ "documentation.css" ]
+++
<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>dunstify - a program to send desktop notifications</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rev="made" href="mailto:root@localhost" />
</head>

<body>



<ul id="index">
  <li><a href="#NAME">NAME</a></li>
  <li><a href="#SYNOPSIS">SYNOPSIS</a></li>
  <li><a href="#DESCRIPTION">DESCRIPTION</a></li>
  <li><a href="#OPTIONS">OPTIONS</a></li>
  <li><a href="#SEE-ALSO">SEE ALSO</a></li>
</ul>

<h1 id="NAME">NAME</h1>

<p>dunstify - a program to send desktop notifications</p>

<h1 id="SYNOPSIS">SYNOPSIS</h1>

<p>dunstify [OPTION...] SUMMARY [BODY]</p>

<h1 id="DESCRIPTION">DESCRIPTION</h1>

<p>Dunstify is a notify-send alternative that can be used to send desktop notifications from the command line.</p>

<h1 id="OPTIONS">OPTIONS</h1>

<dl>

<dt id="help"><b>-?, --help</b></dt>
<dd>

<p>Show help options.</p>

</dd>
<dt id="a---appname-NAME"><b>-a, --appname=NAME</b></dt>
<dd>

<p>Set the app name of the notification.</p>

</dd>
<dt id="u---urgency-URG"><b>-u, --urgency=URG</b></dt>
<dd>

<p>Set the urgency level (low, normal, critical) of the notification.</p>

</dd>
<dt id="h---hints-HINT"><b>-h, --hints=HINT</b></dt>
<dd>

<p>Specifies hints to pass. Valid types are BOOLEAN, INT, DOUBLE, STRING, BYTE and VARIANT.</p>

</dd>
<dt id="A---action-ACTION"><b>-A, --action=ACTION</b></dt>
<dd>

<p>Specifies the actions to display to the user.</p>

</dd>
<dt id="t---timeout-TIMEOUT"><b>-t, --timeout=TIMEOUT</b></dt>
<dd>

<p>The time in milliseconds until the notification expires.</p>

</dd>
<dt id="i---icon-ICON"><b>-i, --icon=ICON</b></dt>
<dd>

<p>Specifies an icon to display with the notification.</p>

</dd>
<dt id="I---raw_icon-PATH"><b>-I, --raw_icon=PATH</b></dt>
<dd>

<p>Path to the icon to be sent as raw image data.</p>

</dd>
<dt id="c---capabilities"><b>-c, --capabilities</b></dt>
<dd>

<p>Print the server capabilities and exit.</p>

</dd>
<dt id="s---serverinfo"><b>-s, --serverinfo</b></dt>
<dd>

<p>Print server information and exit.</p>

</dd>
<dt id="p---printid"><b>-p, --printid</b></dt>
<dd>

<p>Print id, which can be used to update/replace this notification.</p>

</dd>
<dt id="r---replace-ID"><b>-r, --replace=ID</b></dt>
<dd>

<p>Set the id of this notification to The ID of the notification to replace.</p>

</dd>
<dt id="C---close-ID"><b>-C, --close=ID</b></dt>
<dd>

<p>Close the notification with the specified ID.</p>

</dd>
<dt id="b---block"><b>-b, --block</b></dt>
<dd>

<p>Block until notification is closed and print close reason.</p>

</dd>
</dl>

<h1 id="SEE-ALSO">SEE ALSO</h1>

<p>notify-send(1), dunst(5), dunstctl(1), dunst(1)</p>


</body>

</html>


