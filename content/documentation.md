+++
weight = 3
title = "Documentation"
menu = "main"
type = "page"
toc = "true"
+++

<ul id="index">
  <li><a href="#NAME">NAME</a></li>
  <li><a href="#SYNOPSIS">SYNOPSIS</a></li>
  <li><a href="#DESCRIPTION">DESCRIPTION</a></li>
  <li><a href="#COMMAND-LINE-OPTIONS">COMMAND LINE OPTIONS</a></li>
  <li><a href="#CONFIGURATION">CONFIGURATION</a>
    <ul>
      <li><a href="#Command-line">Command line</a></li>
      <li><a href="#Global-section">Global section</a></li>
      <li><a href="#Shortcut-section">Shortcut section</a></li>
      <li><a href="#Urgency-sections">Urgency sections</a></li>
    </ul>
  </li>
  <li><a href="#HISTORY">HISTORY</a></li>
  <li><a href="#RULES">RULES</a>
    <ul>
      <li><a href="#SCRIPTING">SCRIPTING</a></li>
    </ul>
  </li>
  <li><a href="#COLORS">COLORS</a>
    <ul>
      <li><a href="#NOTIFY-SEND">NOTIFY-SEND</a></li>
    </ul>
  </li>
  <li><a href="#ACTIONS">ACTIONS</a></li>
  <li><a href="#TIME-FORMAT">TIME FORMAT</a></li>
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

<p>dunst [-conf file] [-font font] [-geometry geom] [-format fmt] [-follow mode] [-monitor n] [-history_length n] ...</p>

<h1 id="DESCRIPTION">DESCRIPTION</h1>

<p>Dunst is a highly configurable and lightweight notification daemon.</p>

<h1 id="COMMAND-LINE-OPTIONS">COMMAND LINE OPTIONS</h1>

<dl>

<dt id="h---help"><b>-h/--help</b></dt>
<dd>

<p>List all command line flags</p>

</dd>
<dt id="conf--config-file"><b>-conf/-config file</b></dt>
<dd>

<p>Use alternative config file.</p>

</dd>
<dt id="v---version"><b>-v/--version</b></dt>
<dd>

<p>Print version information.</p>

</dd>
<dt id="print"><b>-print</b></dt>
<dd>

<p>Print notifications to stdout. This might be useful for logging, setting up rules or using the output in other scripts.</p>

</dd>
</dl>

<h1 id="CONFIGURATION">CONFIGURATION</h1>

<p>An example configuration file is included (usually /usr/share/dunst/dunstrc). To change the configuration, copy this file to ~/.config/dunst/dunstrc and edit it accordingly.</p>

<p>The configuration is divided into sections in an ini-like format. The &#39;global&#39; section contains most general settings while the &#39;shortcuts&#39; sections contains all keyboard configuration and the &#39;experimental&#39; section all the features that have not yet been tested thoroughly.</p>

<p>Any section that is not one of the above is assumed to be a rule, see RULES for more details.</p>

<p>For backwards compatibility reasons the section name &#39;frame&#39; is considered bound and can&#39;t be used as a rule.</p>

<h2 id="Command-line">Command line</h2>

<p>Each configuration option in the global section can be overridden from the command line by adding a single dash in front of it&#39;s name. For example the font option can be overridden by running</p>

<pre><code>    $ dunst -font &quot;LiberationSans Mono 4&quot;</code></pre>

<p>Configuration options that take boolean values can only currently be set to &quot;true&quot; through the command line via the same method. e.g.</p>

<pre><code>    $ dunst -shrink</code></pre>

<p>This is a known limitation of the way command line parameters are parsed and will be changed in the future.</p>

<p>Available settings per section:</p>

<h2 id="Global-section">Global section</h2>

<dl>

<dt id="monitor-default:-0"><b>monitor</b> (default: 0)</dt>
<dd>

<p>Specifies on which monitor the notifications should be displayed in, count starts at 0. See the <b>follow</b> setting.</p>

</dd>
<dt id="follow-values:-none-mouse-keyboard-default:-none"><b>follow</b> (values: [none/mouse/keyboard] default: none)</dt>
<dd>

<p>Defines where the notifications should be placed in a multi-monitor setup. All values except <i>none</i> override the <b>monitor</b> setting.</p>

<dl>

<dt id="none"><b>none</b></dt>
<dd>

<p>The notifications will be placed on the monitor specified by the <b>monitor</b> setting.</p>

</dd>
<dt id="mouse"><b>mouse</b></dt>
<dd>

<p>The notifications will be placed on the monitor that the mouse is currently in.</p>

</dd>
<dt id="keyboard"><b>keyboard</b></dt>
<dd>

<p>The notifications will be placed on the monitor that contains the window with keyboard focus.</p>

</dd>
</dl>

</dd>
<dt id="geometry-format:-width-x-height---x---y-default:-0x0-0-0"><b>geometry</b> (format: [{width}][x{height}][+/-{x}[+/-{y}]], default: &quot;0x0+0-0&quot;)</dt>
<dd>

<p>The geometry of the window the notifications will be displayed in.</p>

<dl>

<dt id="width"><b>width</b></dt>
<dd>

<p>The width of the notification window in pixels. A negative value sets the width to the screen width <b>minus the absolute value of the width</b>. If the width is omitted then the window expands to cover the whole screen. If it&#39;s 0 the window expands to the width of the longest message being displayed.</p>

</dd>
<dt id="height"><b>height</b></dt>
<dd>

<p>The number of notifications that can appear at one time. When this limit is reached any additional notifications will be queued and displayed when the currently displayed ones either time out or are manually dismissed. If <b>indicate_hidden</b> is true, then the specified limit is reduced by 1 and the last notification is a message informing how many hidden notifications are waiting to be displayed. See the <b>indicate_hidden</b> entry for more information.</p>

<p>The physical(pixel) height of the notifications vary depending on the number of lines that need to be displayed.</p>

<p>See <b>notification_height</b> for changing the physical height.</p>

</dd>
<dt id="x-y"><b>x/y</b></dt>
<dd>

<p>Respectively the horizontal and vertical offset in pixels from the corner of the screen that the notification should be drawn at. For the horizontal(x) offset, a positive value is measured from the left of the screen while a negative one from the right. For the vertical(y) offset, a positive value is measured from the top while a negative from the bottom.</p>

<p>It&#39;s important to note that the positive and negative sign <b>DOES</b> affect the position even if the offset is 0. For example, a horizontal offset of +0 puts the notification on the left border of the screen while a horizontal offset of -0 at the right border. The same goes for the vertical offset.</p>

</dd>
</dl>

</dd>
<dt id="indicate_hidden-values:-true-false-default:-true"><b>indicate_hidden</b> (values: [true/false], default: true)</dt>
<dd>

<p>If this is set to true, a notification indicating how many notifications are not being displayed due to the notification limit (see <b>geometry</b>) will be shown <b>in place of the last notification slot</b>.</p>

<p>Meaning that if this is enabled the number of visible notifications will be 1 less than what is specified in geometry, the last slot will be taken by the hidden count.</p>

</dd>
<dt id="shrink-values:-true-false-default:-false"><b>shrink</b> (values: [true/false], default: false)</dt>
<dd>

<p>Shrink window if it&#39;s smaller than the width. Will be ignored if width is 0.</p>

<p>This is used mainly in order to have the shrinking benefit of dynamic width (see geometry) while also having an upper bound on how long a notification can get before wrapping.</p>

</dd>
<dt id="transparency-default:-0"><b>transparency</b> (default: 0)</dt>
<dd>

<p>A 0-100 range on how transparent the notification window should be, with 0 being fully opaque and 100 invisible.</p>

<p>This setting will only work if a compositor is running.</p>

</dd>
<dt id="notification_height-default:-0"><b>notification_height</b> (default: 0)</dt>
<dd>

<p>The minimum height of the notification window in pixels. If the text and padding cannot fit in within the height specified by this value, the height will be increased as needed.</p>

</dd>
<dt id="separator_height-default:-2"><b>separator_height</b> (default: 2)</dt>
<dd>

<p>The height in pixels of the separator between notifications, if set to 0 there will be no separating line between notifications.</p>

</dd>
<dt id="padding-default:-0"><b>padding</b> (default: 0)</dt>
<dd>

<p>The distance in pixels from the content to the separator/border of the window in the vertical axis</p>

</dd>
<dt id="horizontal_padding-default:-0"><b>horizontal_padding</b> (default: 0)</dt>
<dd>

<p>The distance in pixels from the content to the border of the window in the horizontal axis</p>

</dd>
<dt id="frame_width-default:-0"><b>frame_width</b> (default: 0)</dt>
<dd>

<p>Defines width in pixels of frame around the notification window. Set to 0 to disable.</p>

</dd>
<dt id="frame_color-color-default:-888888"><b>frame_color color</b> (default: #888888)</dt>
<dd>

<p>Defines color of the frame around the notification window. See COLORS.</p>

</dd>
<dt id="separator_color-values:-auto-foreground-frame-RRGGBB-default:-auto"><b>separator_color</b> (values: [auto/foreground/frame/#RRGGBB] default: auto)</dt>
<dd>

<p>Sets the color of the separator line between two notifications.</p>

<dl>

<dt id="auto"><b>auto</b></dt>
<dd>

<p>Dunst tries to find a color that fits the rest of the notification color scheme automatically.</p>

</dd>
<dt id="foreground"><b>foreground</b></dt>
<dd>

<p>The color will be set to the same as the foreground color of the topmost notification that&#39;s being separated.</p>

</dd>
<dt id="frame"><b>frame</b></dt>
<dd>

<p>The color will be set to the frame color of the notification with the highest urgency between the 2 notifications that are being separated.</p>

</dd>
<dt id="anything-else"><b>anything else</b></dt>
<dd>

<p>Any other value is interpreted as a color, see COLORS</p>

</dd>
</dl>

</dd>
<dt id="sort-values:-true-false-default:-true"><b>sort</b> (values: [true/false], default: true)</dt>
<dd>

<p>If set to true, display notifications with higher urgency above the others.</p>

</dd>
<dt id="idle_threshold-default:-0"><b>idle_threshold</b> (default: 0)</dt>
<dd>

<p>Don&#39;t timeout notifications if user is idle longer than this time. See TIME FORMAT for valid times.</p>

<p>Set to 0 to disable.</p>

<p>A client can mark a notification as transient to bypass this setting and timeout anyway. Use a rule with &#39;set_transient = no&#39; to disable this behavior.</p>

</dd>
<dt id="font-default:-Monospace-8"><b>font</b> (default: &quot;Monospace 8&quot;)</dt>
<dd>

<p>Defines the font or font set used. Optionally set the size as a decimal number after the font name and space. Multiple font options can be separated with commas.</p>

<p>This options is parsed as a Pango font description.</p>

</dd>
<dt id="line_height-default:-0"><b>line_height</b> (default: 0)</dt>
<dd>

<p>The amount of extra spacing between text lines in pixels. Set to 0 to disable.</p>

</dd>
<dt id="markup-values:-full-strip-no-default:-no"><b>markup</b> (values: [full/strip/no], default: no)</dt>
<dd>

<p>Defines how markup in notifications is handled.</p>

<p>It&#39;s important to note that markup in the format option will be parsed regardless of what this is set to.</p>

<p>Possible values:</p>

<dl>

<dt id="full"><b>full</b></dt>
<dd>

<p>Allow a small subset of html markup in notifications</p>

<pre><code>    &lt;b&gt;bold&lt;/b&gt;
    &lt;i&gt;italic&lt;/i&gt;
    &lt;s&gt;strikethrough&lt;/s&gt;
    &lt;u&gt;underline&lt;/u&gt;</code></pre>

<p>For a complete reference see &lt;http://developer.gnome.org/pango/stable/PangoMarkupFormat.html&gt;</p>

</dd>
<dt id="strip"><b>strip</b></dt>
<dd>

<p>This setting is provided for compatibility with some broken clients that send markup even though it&#39;s not enabled on the server.</p>

<p>Dunst will try to strip the markup but the parsing is simplistic so using this option outside of matching rules for specific applications <b>IS GREATLY DISCOURAGED</b>.</p>

<p>See RULES</p>

</dd>
<dt id="no"><b>no</b></dt>
<dd>

<p>Disable markup parsing, incoming notifications will be treated as plain text. Dunst will not advertise that it can parse markup if this is set as a global setting.</p>

</dd>
</dl>

</dd>
<dt id="format-default:-s-b"><b>format</b> (default: &quot;%s %b&quot;)</dt>
<dd>

<p>Specifies how the various attributes of the notification should be formatted on the notification window.</p>

<p>Regardless of the status of the <b>markup</b> setting, any markup tags that are present in the format will be parsed. Note that because of that, if a literal ampersand (&amp;) is needed it needs to be escaped as &#39;&amp;amp;&#39;</p>

<p>If &#39;\n&#39; is present anywhere in the format, it will be replaced with a literal newline.</p>

<p>If any of the following strings are present, they will be replaced with the equivalent notification attribute.</p>

<dl>

<dt id="a-appname"><b>%a</b> appname</dt>
<dd>

</dd>
<dt id="s-summary"><b>%s</b> summary</dt>
<dd>

</dd>
<dt id="b-body"><b>%b</b> body</dt>
<dd>

</dd>
<dt id="i-iconname-including-its-path"><b>%i</b> iconname (including its path)</dt>
<dd>

</dd>
<dt id="I-iconname-without-its-path"><b>%I</b> iconname (without its path)</dt>
<dd>

</dd>
<dt id="p-progress-value-0-to-100"><b>%p</b> progress value ([ 0%] to [100%])</dt>
<dd>

</dd>
<dt id="n-progress-value-without-any-extra-characters"><b>%n</b> progress value without any extra characters</dt>
<dd>

</dd>
<dt id="Literal"><b>%%</b> Literal %</dt>
<dd>

</dd>
</dl>

<p>If any of these exists in the format but hasn&#39;t been specified in the notification (e.g. no icon has been set), the placeholders will simply be removed from the format.</p>

</dd>
<dt id="alignment-values:-left-center-right-default:-left"><b>alignment</b> (values: [left/center/right], default: left)</dt>
<dd>

<p>Defines how the text should be aligned within the notification.</p>

</dd>
<dt id="show_age_threshold-default:--1"><b>show_age_threshold</b> (default: -1)</dt>
<dd>

<p>Show age of message if message is older than this time. See TIME FORMAT for valid times.</p>

<p>Set to -1 to disable.</p>

</dd>
<dt id="word_wrap-values:-true-false-default:-false"><b>word_wrap</b> (values: [true/false], default: false)</dt>
<dd>

<p>Specifies how very long lines should be handled</p>

<p>If it&#39;s set to false, long lines will be truncated and ellipsized.</p>

<p>If it&#39;s set to true, long lines will be broken into multiple lines expanding the notification window height as necessary for them to fit.</p>

</dd>
<dt id="ellipsize-values:-start-middle-end-default:-middle"><b>ellipsize</b> (values: [start/middle/end], default: middle)</dt>
<dd>

<p>If word_wrap is set to false, specifies where truncated lines should be ellipsized.</p>

</dd>
<dt id="ignore_newline-values:-true-false-default:-false"><b>ignore_newline</b> (values: [true/false], default: false)</dt>
<dd>

<p>If set to true, replace newline characters in notifications with whitespace.</p>

</dd>
<dt id="stack_duplicates-values:-true-false-default:-true"><b>stack_duplicates</b> (values: [true/false], default: true)</dt>
<dd>

<p>If set to true, duplicate notifications will be stacked together instead of being displayed separately.</p>

<p>Two notifications are considered duplicate if the name of the program that sent it, summary, body, icon and urgency are all identical.</p>

</dd>
<dt id="hide_duplicates_count-values:-true-false-default:-false"><b>hide_duplicates_count</b> (values: [true/false], default: false)</dt>
<dd>

<p>Hide the count of stacked duplicate notifications.</p>

</dd>
<dt id="show_indicators-values:-true-false-default:-true"><b>show_indicators</b> (values: [true/false], default: true)</dt>
<dd>

<p>Show an indicator if a notification contains actions and/or open-able URLs. See ACTIONS below for further details.</p>

</dd>
<dt id="icon_position-values:-left-right-off-default:-off"><b>icon_position</b> (values: [left/right/off], default: off)</dt>
<dd>

<p>Defines the position of the icon in the notification window. Setting it to off disables icons.</p>

</dd>
<dt id="max_icon_size-default:-0"><b>max_icon_size</b> (default: 0)</dt>
<dd>

<p>Defines the maximum size in pixels for the icons. If the icon is smaller than the specified value it won&#39;t be affected. If it&#39;s larger then it will be scaled down so that the larger axis is equivalent to the specified size.</p>

<p>Set to 0 to disable icon scaling. (default)</p>

<p>If <b>icon_position</b> is set to off, this setting is ignored.</p>

</dd>
<dt id="icon_path-default:-usr-share-icons-gnome-16x16-status-:-usr-share-icons-gnome-16x16-devices"><b>icon_path</b> (default: &quot;/usr/share/icons/gnome/16x16/status/:/usr/share/icons/gnome/16x16/devices/&quot;)</dt>
<dd>

<p>Can be set to a colon-separated list of paths to search for icons to use with notifications.</p>

<p>Dunst doesn&#39;t currently do any type of icon lookup outside of these directories.</p>

</dd>
<dt id="sticky_history-values:-true-false-default:-true"><b>sticky_history</b> (values: [true/false], default: true)</dt>
<dd>

<p>If set to true, notifications that have been recalled from history will not time out automatically.</p>

</dd>
<dt id="history_length-default:-20"><b>history_length</b> (default: 20)</dt>
<dd>

<p>Maximum number of notifications that will be kept in history. After that limit is reached, older notifications will be deleted once a new one arrives. See HISTORY.</p>

</dd>
<dt id="dmenu-default:-usr-bin-dmenu"><b>dmenu</b> (default: &quot;/usr/bin/dmenu&quot;)</dt>
<dd>

<p>The command that will be run when opening the context menu. Should be either a dmenu command or a dmenu-compatible menu.</p>

</dd>
<dt id="browser-default:-usr-bin-firefox"><b>browser</b> (default: &quot;/usr/bin/firefox&quot;)</dt>
<dd>

<p>The command that will be run when opening a URL. The URL to be opened will be appended to the end of the value of this setting.</p>

</dd>
<dt id="always_run_script-values:-true-false-default:-true"><b>always_run_script</b> (values: [true/false] default: true]</dt>
<dd>

<p>Always run rule-defined scripts, even if the notification is suppressed with format = &quot;&quot;. See SCRIPTING.</p>

</dd>
<dt id="title-default:-Dunst"><b>title</b> (default: &quot;Dunst&quot;)</dt>
<dd>

<p>Defines the title of notification windows spawned by dunst. (_NET_WM_NAME property). There should be no need to modify this setting for regular use.</p>

</dd>
<dt id="class-default:-Dunst"><b>class</b> (default: &quot;Dunst&quot;)</dt>
<dd>

<p>Defines the class of notification windows spawned by dunst. (First part of WM_CLASS). There should be no need to modify this setting for regular use.</p>

</dd>
<dt id="startup_notification-values:-true-false-default:-false"><b>startup_notification</b> (values: [true/false], default: false)</dt>
<dd>

<p>Display a notification on startup. This is usually used for debugging and there shouldn&#39;t be any need to use this option.</p>

</dd>
<dt id="verbosity-values:-crit-warn-mesg-info-debug-default-mesg"><b>verbosity</b> (values: &#39;crit&#39;, &#39;warn&#39;, &#39;mesg&#39;, &#39;info&#39;, &#39;debug&#39; default &#39;mesg&#39;)</dt>
<dd>

<p>Do not display log messages, which have lower precedence than specified verbosity. This won&#39;t affect printing notifications on the terminal. Use the &#39;-print&#39; option for this.</p>

</dd>
<dt id="force_xinerama-values:-true-false-default:-false"><b>force_xinerama</b> (values: [true/false], default: false)</dt>
<dd>

<p>Use the Xinerama extension instead of RandR for multi-monitor support. This setting is provided for compatibility with older nVidia drivers that do not support RandR and using it on systems that support RandR is highly discouraged.</p>

<p>By enabling this setting dunst will not be able to detect when a monitor is connected or disconnected which might break follow mode if the screen layout changes.</p>

</dd>
<dt id="corner_radius-default:-0"><b>corner_radius</b> (default: 0)</dt>
<dd>

<p>Define the corner radius in pixels. A corner radius of 0 will result in rectangular shaped notifications.</p>

<p>By enabling this setting the outer border and the frame will be shaped. If you have multiple notifications, the whole window is shaped, not every single notification.</p>

<p>To avoid the corners clipping the icon or text the corner radius will be automatically lowered to half of the notification height if it exceeds it.</p>

</dd>
<dt id="mouse_left-middle-right_click-values:-none-do_action-close_current-close_all"><b>mouse_left/middle/right_click</b> (values: [none/do_action/close_current/close_all])</dt>
<dd>

<p>Defines action of mouse click.</p>

<dl>

<dt id="none1"><b>none</b></dt>
<dd>

<p>Don&#39;t do anything.</p>

</dd>
<dt id="do_action-default-for-mouse_middle_click"><b>do_action</b> (default for mouse_middle_click)</dt>
<dd>

<p>If the notification has exactly one action, or one is marked as default, invoke it. If there are multiple and no default, open the context menu.</p>

</dd>
<dt id="close_current-default-for-mouse_left_click"><b>close_current</b> (default for mouse_left_click)</dt>
<dd>

<p>Close current notification.</p>

</dd>
<dt id="close_all-default-for-mouse_right_click"><b>close_all</b> (default for mouse_right_click)</dt>
<dd>

<p>Close all notifications.</p>

</dd>
</dl>

</dd>
</dl>

<h2 id="Shortcut-section">Shortcut section</h2>

<p>Keyboard shortcuts are defined in the following format: &quot;Modifier+key&quot; where the modifier is one of ctrl,mod1,mod2,mod3,mod4 and key is any keyboard key.</p>

<dl>

<dt id="close"><b>close</b></dt>
<dd>

<p><b>command line flag</b>: -key &lt;key&gt;</p>

<p>Specifies the keyboard shortcut for closing a notification.</p>

</dd>
<dt id="close_all"><b>close_all</b></dt>
<dd>

<p><b>command line flag</b>: -all_key &lt;key&gt;</p>

<p>Specifies the keyboard shortcut for closing all currently displayed notifications.</p>

</dd>
<dt id="history"><b>history</b></dt>
<dd>

<p><b>command line flag</b>: -history_key &lt;key&gt;</p>

<p>Specifies the keyboard shortcut for recalling a single notification from history.</p>

</dd>
<dt id="context"><b>context</b></dt>
<dd>

<p><b>command line flag</b>: -context_key &lt;key&gt;</p>

<p>Specifies the keyboard shortcut that opens the context menu.</p>

</dd>
</dl>

<h2 id="Urgency-sections">Urgency sections</h2>

<p>The urgency sections work in a similar way to rules and can be used to specify attributes for the different urgency levels of notifications (low, normal, critical). Currently only the background, foreground, timeout, frame_color and icon attributes can be modified.</p>

<p>The urgency sections are urgency_low, urgency_normal, urgency_critical for low, normal and critical urgency respectively.</p>

<p>See the example configuration file for examples.</p>

<p>Additionally, you can override these settings via the following command line flags:</p>

<p>Please note these flags may be removed in the future. See issue #328 in the bug tracker for discussions (See REPORTING BUGS).</p>

<dl>

<dt id="li-ni-ci-icon"><b>-li/ni/ci icon</b></dt>
<dd>

<p>Defines the icon for low, normal and critical notifications respectively.</p>

<p>Where <i>icon</i> is a path to an image file containing the icon.</p>

</dd>
<dt id="lf-nf-cf-color"><b>-lf/nf/cf color</b></dt>
<dd>

<p>Defines the foreground color for low, normal and critical notifications respectively.</p>

<p>See COLORS for the value format.</p>

</dd>
<dt id="lb-nb-cb-color"><b>-lb/nb/cb color</b></dt>
<dd>

<p>Defines the background color for low, normal and critical notifications respectively.</p>

<p>See COLORS for the value format.</p>

</dd>
<dt id="lfr-nfr-cfr-color"><b>-lfr/nfr/cfr color</b></dt>
<dd>

<p>Defines the frame color for low, normal and critical notifications respectively.</p>

<p>See COLORS for more information</p>

</dd>
<dt id="lto-nto-cto-secs"><b>-lto/nto/cto secs</b></dt>
<dd>

<p>Defines the timeout time for low, normal and critical notifications respectively. See TIME FORMAT for valid times.</p>

</dd>
</dl>

<h1 id="HISTORY">HISTORY</h1>

<p>Dunst saves a number of notifications (specified by <b>history_length</b>) in memory. These notifications can be recalled (i.e. redisplayed) by pressing the <b>history_key</b> (see the shortcuts section), whether these notifications will time out like if they have been just send depends on the value of the <b>sticky_history</b> setting.</p>

<p>Past notifications are redisplayed in a first-in-last-out order, meaning that pressing the history key once will bring up the most recent notification that had been closed/timed out.</p>

<h1 id="RULES">RULES</h1>

<p>Rules allow the conditional modification of notifications. They are defined by creating a section in the configuration file that has any name that is not already used internally (i.e. any name other than &#39;global&#39;, &#39;experimental&#39;, &#39;frame&#39;, &#39;shortcuts&#39;, &#39;urgency_low&#39;, &#39;urgency_normal&#39; and &#39;urgency_critical&#39;).</p>

<p>There are 2 parts in configuring a rule: Defining the filters that control when a rule should apply and then the actions that should be taken when the rule is matched.</p>

<dl>

<dt id="filtering"><b>filtering</b></dt>
<dd>

<p>Notifications can be matched for any of the following attributes:</p>

<dl>

<dt id="appname-discouraged-see-desktop_entry"><code>appname</code> (discouraged, see desktop_entry)</dt>
<dd>

<p>The name of the application as reported by the client. Be aware that the name can often differ depending on the locale used.</p>

</dd>
<dt id="body"><code>body</code></dt>
<dd>

<p>The body of the notification</p>

</dd>
<dt id="category"><code>category</code></dt>
<dd>

<p>The category of the notification as defined by the notification spec. See https://developer.gnome.org/notification-spec/#categories</p>

</dd>
<dt id="desktop_entry"><code>desktop_entry</code></dt>
<dd>

<p>GLib based applications export their desktop-entry name. In comparison to the appname, the desktop-entry won&#39;t get localized.</p>

</dd>
<dt id="icon"><code>icon</code></dt>
<dd>

<p>The icon of the notification in the form of a file path. Can be empty if no icon is available or a raw icon is used instead.</p>

</dd>
<dt id="match_transient"><code>match_transient</code></dt>
<dd>

<p>Match if the notification has been declared as transient by the client or by some other rule.</p>

<p>See <code>set_transient</code> for more details about this attribute.</p>

</dd>
<dt id="msg_urgency"><code>msg_urgency</code></dt>
<dd>

<p>Matches the urgency of the notification as set by the client or by some other rule.</p>

</dd>
<dt id="stack_tag"><code>stack_tag</code></dt>
<dd>

<p>Matches the stack tag of the notification as set by the client or by some other rule.</p>

<p>See set_stack_tag for more information about stack tags.</p>

</dd>
<dt id="summary"><code>summary</code></dt>
<dd>

<p>Matches the summary, &#39;title&#39;, of the notification.</p>

</dd>
</dl>

<p><code>msg_urgency</code> is the urgency of the notification, it is named so to not conflict with trying to modify the urgency.</p>

<p>Instead of the appname filter, it&#39;s recommended to use the desktop_entry filter.</p>

<p>To define a matching rule simply assign the specified value to the value that should be matched, for example:</p>

<pre><code>    appname=&quot;notify-send&quot;</code></pre>

<p>Matches only messages that were send via notify-send. If multiple filter expressions are present, all of them have to match for the rule to be applied (logical AND).</p>

<p>Shell-like globing is supported.</p>

</dd>
<dt id="modifying"><b>modifying</b></dt>
<dd>

<p>The following attributes can be overridden:</p>

<dl>

<dt id="background"><code>background</code></dt>
<dd>

<p>The background color of the notification. See COLORS for possible values.</p>

</dd>
<dt id="foreground1"><code>foreground</code></dt>
<dd>

<p>The background color of the notification. See COLORS for possible values.</p>

</dd>
<dt id="format"><code>format</code></dt>
<dd>

<p>Equivalent to the <code>format</code> setting.</p>

</dd>
<dt id="frame_color"><code>frame_color</code></dt>
<dd>

<p>The frame color color of the notification. See COLORS for possible values.</p>

</dd>
<dt id="fullscreen"><code>fullscreen</code></dt>
<dd>

<p>One of show, delay, or pushback.</p>

<p>This attribute speicifies how notifications are handled if a fullscreen window is focused. By default it&#39;s set to show so notifications are being shown.</p>

<p>Other possible values are delay: Already shown notifications are continued to be displayed until they are dismissed or time out but new notifications will be held back and displayed when the focus to the fullscreen window is lost.</p>

<p>Or pushback which is equivalent to delay with the difference that already existing notifications are paused and hidden until the focus to the fullscreen window is lost.</p>

</dd>
<dt id="new_icon"><code>new_icon</code></dt>
<dd>

<p>Updates the icon of the notification, it should be a path to a valid image.</p>

</dd>
<dt id="set_stack_tag"><code>set_stack_tag</code></dt>
<dd>

<p>Sets the stack tag for the notification, notifications with the same (non-empty) stack tag will replace each-other so only the newest one is visible. This can be useful for example in volume or brightness notifications where only want one of the same type visible.</p>

<p>The stack tag can be set by the client with the &#39;synchronous&#39;, &#39;private-synchronous&#39; &#39;x-canonical-private-synchronous&#39; or the &#39;x-dunst-stack-tag&#39; hints.</p>

</dd>
<dt id="set_transient"><code>set_transient</code></dt>
<dd>

<p>Sets whether the notification is considered transient. Transient notifications will bypass the idle_threshold setting.</p>

<p>By default notifications are _not_ considered transient but clients can set the value of this by specifying the &#39;transient&#39; hint when sending notifications.</p>

</dd>
<dt id="timeout"><code>timeout</code></dt>
<dd>

<p>Equivalent to the <code>timeout</code> setting in the urgency sections.</p>

</dd>
<dt id="urgency"><code>urgency</code></dt>
<dd>

<p>This sets the notification urgency.</p>

<p><b>IMPORTANT NOTE</b>: This currently DOES NOT re-apply the attributes from the urgency_* sections. The changed urgency will only be visible in rules defined later. Use <code>msg_urgency</code> to match it.</p>

</dd>
<dt id="skip_display"><code>skip_display</code></dt>
<dd>

<p>Setting this to true will prevent the notification from being displayed initially but will be saved in history for later viewing.</p>

</dd>
</dl>

<p>As with the filtering attributes, each one corresponds to the respective notification attribute to be modified.</p>

<p>As with filtering, to make a rule modify an attribute simply assign it in the rule definition.</p>

<p>If the format is set to an empty string, the notification will not be suppressed.</p>

</dd>
</dl>

<h2 id="SCRIPTING">SCRIPTING</h2>

<p>Within rules you can specify a script to be run every time the rule is matched by assigning the &#39;script&#39; option to the name of the script to be run.</p>

<p>When the script is called details of the notification that triggered it will be passed via command line parameters in the following order: appname, summary, body, icon, urgency.</p>

<p>Where icon is the absolute path to the icon file if there is one and urgency is one of &quot;LOW&quot;, &quot;NORMAL&quot; or &quot;CRITICAL&quot;.</p>

<p>If the notification is suppressed, the script will not be run unless <b>always_run_scripts</b> is set to true.</p>

<p>If &#39;~/&#39; occurs at the beginning of the script parameter, it will get replaced by the users&#39; home directory. If the value is not an absolute path, the directories in the PATH variable will be searched for an executable of the same name.</p>

<h1 id="COLORS">COLORS</h1>

<p>Colors are interpreted as X11 color values. This includes both verbatim color names such as &quot;Yellow&quot;, &quot;Blue&quot;, &quot;White&quot;, etc as well as #RGB and #RRGGBB values.</p>

<p><b>NOTE</b>: &#39;#&#39; is interpreted as a comment, to use it the entire value needs to be in quotes like so: separator_color=&quot;#123456&quot;</p>

<h2 id="NOTIFY-SEND">NOTIFY-SEND</h2>

<p>dunst is able to get different colors for a message via notify-send. In order to do that you have to add a hint via the -h option. The progress value can be set with a hint, too.</p>

<dl>

<dt id="notify-send--h-string:fgcolor:-ff4444">notify-send -h string:fgcolor:#ff4444</dt>
<dd>

</dd>
<dt id="notify-send--h-string:bgcolor:-4444ff--h-string:fgcolor:-ff4444--h-string:frcolor:-44ff44">notify-send -h string:bgcolor:#4444ff -h string:fgcolor:#ff4444 -h string:frcolor:#44ff44</dt>
<dd>

</dd>
<dt id="notify-send--h-int:value:42-Working">notify-send -h int:value:42 &quot;Working ...&quot;</dt>
<dd>

</dd>
</dl>

<h1 id="ACTIONS">ACTIONS</h1>

<p>Dunst allows notifiers (i.e.: programs that send the notifications) to specify actions. Dunst has support for both displaying indicators for these, and interacting with these actions.</p>

<p>If &quot;show_indicators&quot; is true and a notification has an action, an &quot;(A)&quot; will be prepended to the notification format. Likewise, an &quot;(U)&quot; is prepended to notifications with URLs. It is possible to interact with notifications that have actions regardless of this setting, though it may not be obvious which notifications HAVE actions.</p>

<p>The &quot;context&quot; keybinding is used to interact with these actions, by showing a menu of possible actions. This feature requires &quot;dmenu&quot; or a dmenu drop-in replacement present.</p>

<p>Alternatively, you can invoke an action with a middle click on the notification. If there is exactly one associated action, or one is marked as default, that one is invoked. If there are multiple, the context menu is shown. The same applies to URLs when there are no actions.</p>

<h1 id="TIME-FORMAT">TIME FORMAT</h1>

<p>A time can be any decimal integer value suffixed with a time unit. If no unit given, seconds (&quot;s&quot;) is taken as default.</p>

<p>Time units understood by dunst are &quot;ms&quot;, &quot;s&quot;, &quot;m&quot;, &quot;h&quot; and &quot;d&quot;.</p>

<p>Example time: &quot;1000ms&quot; &quot;10m&quot;</p>

<h1 id="MISCELLANEOUS">MISCELLANEOUS</h1>

<p>Dunst can be paused by sending a notification with a summary of &quot;DUNST_COMMAND_PAUSE&quot;, resumed with a summary of &quot;DUNST_COMMAND_RESUME&quot; and toggled with a summary of &quot;DUNST_COMMAND_TOGGLE&quot;. Alternatively you can send SIGUSR1 and SIGUSR2 to pause and unpause respectively. For Example:</p>

<dl>

<dt id="killall--SIGUSR1-dunst-pause">killall -SIGUSR1 dunst # pause</dt>
<dd>

</dd>
<dt id="killall--SIGUSR2-dunst-resume">killall -SIGUSR2 dunst # resume</dt>
<dd>

</dd>
</dl>

<p>When paused dunst will not display any notifications but keep all notifications in a queue. This can for example be wrapped around a screen locker (i3lock, slock) to prevent flickering of notifications through the lock and to read all missed notifications after returning to the computer.</p>

<h1 id="FILES">FILES</h1>

<p>$XDG_CONFIG_HOME/dunst/dunstrc</p>

<p>-or-</p>

<p>$HOME/.config/dunst/dunstrc</p>

<h1 id="AUTHORS">AUTHORS</h1>

<p>Written by Sascha Kruse &lt;knopwob@googlemail.com&gt;</p>

<h1 id="REPORTING-BUGS">REPORTING BUGS</h1>

<p>Bugs and suggestions should be reported on GitHub at https://github.com/dunst-project/dunst/issues</p>

<h1 id="COPYRIGHT">COPYRIGHT</h1>

<p>Copyright 2013 Sascha Kruse and contributors (see LICENSE for licensing information)</p>

<p>If you feel that copyrights are violated, please send me an email.</p>

<h1 id="SEE-ALSO">SEE ALSO</h1>

<p>dwm(1), dmenu(1), twmn(1), notify-send(1)</p>
