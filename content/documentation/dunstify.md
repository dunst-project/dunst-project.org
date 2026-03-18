+++
title = "Documentation"
type = "documentation"
toc = "true"
subtitle = "dunstify"
lastdate = "2026-02-01"
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
  <li><a href="#COPYRIGHT">COPYRIGHT</a></li>
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
<dt id="a---app-name-NAME"><b>-a, --app-name=NAME</b></dt>
<dd>

<p>Set the app name of the notification. Accepted legacy alias: <b>--appname</b>.</p>

</dd>
<dt id="u---urgency-URG"><b>-u, --urgency=URG</b></dt>
<dd>

<p>Set the urgency level (low, normal, critical) of the notification.</p>

</dd>
<dt id="h---hint-HINT"><b>-h, --hint=HINT</b></dt>
<dd>

<p>Specifies hints to pass. Valid types are BOOLEAN, INT, DOUBLE, STRING, BYTE and VARIANT. Accepted legacy alias: <b>--hints</b>.</p>

</dd>
<dt id="A---action-ACTION"><b>-A, --action=ACTION</b></dt>
<dd>

<p>Specifies the actions to display to the user.</p>

</dd>
<dt id="e---transient"><b>-e, --transient</b></dt>
<dd>

<p>Mark the notification as transient.</p>

</dd>
<dt id="t---expire-time-TIMEOUT"><b>-t, --expire-time=TIMEOUT</b></dt>
<dd>

<p>The time in milliseconds until the notification expires. Accepted legacy alias: <b>--timeout</b>.</p>

</dd>
<dt id="i---icon-ICON"><b>-i, --icon=ICON</b></dt>
<dd>

<p>Specifies an icon to display with the notification.</p>

</dd>
<dt id="I---raw-icon-PATH"><b>-I, --raw-icon=PATH</b></dt>
<dd>

<p>Path to the icon to be sent as raw image data. Accepted legacy alias: <b>--raw_icon</b>.</p>

</dd>
<dt id="c---category-TYPE"><b>-c, --category=TYPE</b></dt>
<dd>

<p>The category of this notification.</p>

</dd>
<dt id="p---print-id"><b>-p, --print-id</b></dt>
<dd>

<p>Print id, which can be used to update/replace this notification. Accepted legacy alias: <b>--printid</b>.</p>

</dd>
<dt id="r---replace-id-ID"><b>-r, --replace-id=ID</b></dt>
<dd>

<p>Set the id of this notification to The ID of the notification to replace. Accepted legacy alias: <b>--replace</b>.</p>

</dd>
<dt id="C---close-ID"><b>-C, --close=ID</b></dt>
<dd>

<p>Close the notification with the specified ID.</p>

</dd>
<dt id="w---wait"><b>-w, --wait</b></dt>
<dd>

<p>Block until notification is closed and print close reason. Accepted legacy alias: <b>-b, --block</b>.</p>

</dd>
<dt id="stack-tag-TAG"><b>--stack-tag=TAG</b></dt>
<dd>

<p>Set the dunst stack tag property of the notification to TAG. A tagged notification will replace an earlier notification with the same tag.</p>

<p>The following commands are equivalent:</p>

<pre><code>dunstify -h string:x-dunst-stack-tag:TAG &quot;hello&quot;

dunstify --stack-tag TAG &quot;hello&quot;</code></pre>

</dd>
<dt id="capabilities"><b>--capabilities</b></dt>
<dd>

<p>Print the server capabilities and exit.</p>

</dd>
<dt id="serverinfo"><b>--serverinfo</b></dt>
<dd>

<p>Print server information and exit.</p>

</dd>
<dt id="v---version"><b>-v, --version</b></dt>
<dd>

<p>Print dunstify version information. Not present on Dunst versions prior to v1.13.</p>

</dd>
</dl>

<h1 id="COPYRIGHT">COPYRIGHT</h1>

<p>Copyright 2011-2014 Sascha Kruse</p>

<p>Copyright 2014-2026 Dunst contributors</p>

<p>Dunst is released under the BSD 3-Clause License, see LICENSE for more information.</p>

<p>If you feel that copyrights are violated, please send an email to the maintainers.</p>

<h1 id="SEE-ALSO">SEE ALSO</h1>

<p>notify-send(1), dunst(5), dunstctl(1), dunst(1)</p>


</body>

</html>


