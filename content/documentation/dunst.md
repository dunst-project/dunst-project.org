+++
title = "Documentation"
type = "documentation"
toc = "true"
subtitle = "dunst(1)"
lastdate = "2024-12-03"
descript = "Dunst manual page"
wiki = false
css = [ "documentation.css" ]
+++
<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>dunst - A customizable and lightweight notification-daemon</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rev="made" href="mailto:root@localhost" />
</head>

<body>



<ul id="index">
  <li><a href="#NAME">NAME</a></li>
  <li><a href="#SYNOPSIS">SYNOPSIS</a></li>
  <li><a href="#DESCRIPTION">DESCRIPTION</a>
    <ul>
      <li><a href="#Autostarting-dunst">Autostarting dunst</a></li>
    </ul>
  </li>
  <li><a href="#COMMAND-LINE-OPTIONS">COMMAND LINE OPTIONS</a>
    <ul>
      <li><a href="#DEPRECATED-OPTIONS">DEPRECATED OPTIONS</a></li>
    </ul>
  </li>
  <li><a href="#CONFIGURATION">CONFIGURATION</a>
    <ul>
      <li><a href="#NOTIFY-SEND-HINTS">NOTIFY-SEND HINTS</a></li>
    </ul>
  </li>
  <li><a href="#MISCELLANEOUS">MISCELLANEOUS</a></li>
  <li><a href="#FILES">FILES</a></li>
  <li><a href="#AUTHORS">AUTHORS</a></li>
  <li><a href="#REPORTING-BUGS">REPORTING BUGS</a></li>
  <li><a href="#COPYRIGHT">COPYRIGHT</a></li>
  <li><a href="#SEE-ALSO">SEE ALSO</a></li>
</ul>

<h1 id="NAME">NAME</h1>

<p>dunst - A customizable and lightweight notification-daemon</p>

<h1 id="SYNOPSIS">SYNOPSIS</h1>

<p>dunst [-conf file] [-verbosity v] [-print] [--startup_notification]</p>

<h1 id="DESCRIPTION">DESCRIPTION</h1>

<p>Dunst is a highly configurable and lightweight notification daemon.</p>

<h2 id="Autostarting-dunst">Autostarting dunst</h2>

<p>On most installations, dunst should be able to automatically be started by D-Bus when a notification is sent. This is not recommended when multiple notification daemons are installed, because D-Bus will not know which one to start. Other ways of autostarting dunst include starting dunst with your desktop environment or window manager&#39;s autostart functionality or via the provided systemd service.</p>

<h1 id="COMMAND-LINE-OPTIONS">COMMAND LINE OPTIONS</h1>

<dl>

<dt id="h--help---help"><b>-h/-help/--help</b></dt>
<dd>

<p>List all command line flags</p>

</dd>
<dt id="conf--config-file"><b>-conf/-config file</b></dt>
<dd>

<p>Use alternative config file. This disables the search for other config files. If it cannot be opened, dunst will issue a warning and fall back on its internal defaults. (Hint: `dunst -conf - &lt;/dev/null` can be used to enforce the defaults, i.e. for testing)</p>

</dd>
<dt id="v--version---version"><b>-v/-version/--version</b></dt>
<dd>

<p>Print version information.</p>

</dd>
<dt id="verbosity-values:-crit-warn-mesg-info-debug-default-mesg"><b>-verbosity</b> (values: &#39;crit&#39;, &#39;warn&#39;, &#39;mesg&#39;, &#39;info&#39;, &#39;debug&#39; default &#39;mesg&#39;)</dt>
<dd>

<p>Do not display log messages, which have lower precedence than specified verbosity. This won&#39;t affect printing notifications on the terminal. Use the &#39;-print&#39; option for this.</p>

</dd>
<dt id="print---print"><b>-print/--print</b></dt>
<dd>

<p>Print notifications to stdout. This might be useful for logging, setting up rules or using the output in other scripts.</p>

</dd>
<dt id="startup_notification---startup_notification"><b>-startup_notification/--startup_notification</b></dt>
<dd>

<p>Display a notification on startup.</p>

</dd>
</dl>

<h2 id="DEPRECATED-OPTIONS">DEPRECATED OPTIONS</h2>

<p>Old version of dunst allowed changing the colors of different urgencies through command line options. This has been long removed in favour of RULES, see issue #328.</p>

<dl>

<dt id="li-ni-ci-icon"><b>-li/ni/ci icon</b></dt>
<dd>

<p>Set notification icon.</p>

</dd>
<dt id="lf-nf-cf-color"><b>-lf/nf/cf color</b></dt>
<dd>

<p>Set notification foreground color.</p>

</dd>
<dt id="lb-nb-cb-color"><b>-lb/nb/cb color</b></dt>
<dd>

<p>Set notification background color.</p>

</dd>
<dt id="lh-nh-ch-color"><b>-lh/nh/ch color</b></dt>
<dd>

<p>Set notification highlight color.</p>

</dd>
<dt id="lfr-nfr-cfr-color"><b>-lfr/nfr/cfr color</b></dt>
<dd>

<p>Set notification frame color.</p>

</dd>
<dt id="lto-nto-cto-secs"><b>-lto/nto/cto secs</b></dt>
<dd>

<p>Set notification timeout time.</p>

</dd>
</dl>

<h1 id="CONFIGURATION">CONFIGURATION</h1>

<p>A default configuration file is included (usually ##SYSCONFDIR##/dunst/dunstrc) and serves as the least important configuration file. Note: this was previously /usr/share/dunst/dunstrc. You can edit this file to change the system-wide defaults or copy it to a more important location to override its settings. See the FILES section for more details on where dunst searches for its configuration files and how settings get applied.</p>

<p>See dunst(5) for all possible settings.</p>

<h2 id="NOTIFY-SEND-HINTS">NOTIFY-SEND HINTS</h2>

<p>Dunst is able to get different colors for a message via notify-send. In order to do that you have to add a hint via the -h option. The progress value can be set with a hint, too.</p>

<p>See dunst(5) for the list of accepted hints.</p>

<p>Some examples:</p>

<pre><code>notify-send -h string:fgcolor:#ff4444

notify-send -h string:bgcolor:#4444ff -h string:fgcolor:#ff4444 -h string:frcolor:#44ff44

notify-send -h int:value:42 &quot;Working ...&quot;</code></pre>

<h1 id="MISCELLANEOUS">MISCELLANEOUS</h1>

<p>Dunst can be paused via the `dunstctl set-paused true` command. To unpause dunst use `dunstctl set-paused false`. Another way is to send SIGUSR1 and SIGUSR2 to pause and unpause respectively. Pausing using dunstctl is recommended over using signals, because the meaning of the signals isn&#39;t stable and might change in the future.</p>

<p>When paused, dunst won&#39;t display any notifications, but keeps all notifications in a queue. This can for example be wrapped around a screen locker (i3lock, slock) to prevent flickering of notifications through the lock, and to read all missed notifications after returning to the computer.</p>

<h1 id="FILES">FILES</h1>

<p>These are the base directories dunst searches for configuration files in <i>descending order of importance</i>:</p>

<dl>

<dt id="XDG_CONFIG_HOME"><code>$XDG_CONFIG_HOME</code></dt>
<dd>

<p>This is the most important directory. (<code>$HOME/.config</code> if unset or empty)</p>

</dd>
<dt id="XDG_CONFIG_DIRS"><code>$XDG_CONFIG_DIRS</code></dt>
<dd>

<p>This, like <code>$PATH</code> for instance, is a :-separated list of base directories in <i>descending order of importance</i>. (<i>##SYSCONFDIR##</i> if unset or empty)</p>

</dd>
</dl>

<p>Dunst will search these directories for the following relative file paths:</p>

<dl>

<dt id="dunst-dunstrc"><i>dunst/dunstrc</i></dt>
<dd>

<p>This is the base config and as such the least important in a particular base directory.</p>

</dd>
<dt id="dunst-dunstrc.d-.conf"><i>dunst/dunstrc.d/*.conf</i></dt>
<dd>

<p>These are &quot;drop-ins&quot; (mind the &quot;.d&quot; suffix of the directory). They are more important than the base dunstrc in the parent directory, as they are considered to be small snippets to override settings. The last in lexical order is the most important one, so you can easily change the order by renaming them. A common approach to naming drop-ins is to prefix them with numbers, i.e.:</p>

<pre><code>00-least-important.conf
01-foo.conf
20-bar.conf
99-most-important.conf</code></pre>

<p>Only files with the <b>.conf</b> suffix will be read.</p>

</dd>
</dl>

<p>Only settings from the last base config the corresponding drop-ins get applied. So if a dunstrc is first found in <i>~/.config/dunst/dunstrc</i>, drop-ins will be searched in <i>~/.config/dunst/dunstrc.d/*</i>. Settings in more important files override those in less important ones.</p>

<h1 id="AUTHORS">AUTHORS</h1>

<p>Written by Sascha Kruse &lt;knopwob@googlemail.com&gt;</p>

<h1 id="REPORTING-BUGS">REPORTING BUGS</h1>

<p>Bugs and suggestions should be reported on GitHub at https://github.com/dunst-project/dunst/issues</p>

<h1 id="COPYRIGHT">COPYRIGHT</h1>

<p>Copyright 2013 Sascha Kruse and contributors (see LICENSE for licensing information)</p>

<p>If you feel that copyrights are violated, please send me an email.</p>

<h1 id="SEE-ALSO">SEE ALSO</h1>

<p>dunst(5), dunstctl(1), dmenu(1), notify-send(1)</p>


</body>

</html>


