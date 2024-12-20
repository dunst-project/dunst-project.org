+++
title = "Documentation"
type = "documentation"
toc = "true"
subtitle = "dunst(5)"
lastdate = "2024-12-12"
descript = "Dustrc manual page"
wiki = false
menu = "main"
weight = 3
css = [ "documentation.css" ]
+++
<?xml version="1.0" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>dunstrc - dunst configuration file</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rev="made" href="mailto:root@localhost" />
</head>

<body>



<ul id="index">
  <li><a href="#NAME">NAME</a></li>
  <li><a href="#DESCRIPTION">DESCRIPTION</a>
    <ul>
      <li><a href="#Global-section">Global section</a></li>
      <li><a href="#Keyboard-shortcuts-X11-only">Keyboard shortcuts (X11 only)</a></li>
      <li><a href="#Urgency-sections">Urgency sections</a></li>
    </ul>
  </li>
  <li><a href="#DUNSTCTL">DUNSTCTL</a></li>
  <li><a href="#HISTORY">HISTORY</a></li>
  <li><a href="#WAYLAND">WAYLAND</a></li>
  <li><a href="#RULES">RULES</a>
    <ul>
      <li><a href="#SCRIPTING">SCRIPTING</a></li>
    </ul>
  </li>
  <li><a href="#COLORS">COLORS</a></li>
  <li><a href="#NOTIFY-SEND-HINTS">NOTIFY-SEND HINTS</a></li>
  <li><a href="#ACTIONS">ACTIONS</a></li>
  <li><a href="#TIME-FORMAT">TIME FORMAT</a></li>
  <li><a href="#AUTHORS">AUTHORS</a></li>
  <li><a href="#REPORTING-BUGS">REPORTING BUGS</a></li>
  <li><a href="#COPYRIGHT">COPYRIGHT</a></li>
  <li><a href="#SEE-ALSO">SEE ALSO</a></li>
</ul>

<h1 id="NAME">NAME</h1>

<p>dunstrc - dunst configuration file</p>

<h1 id="DESCRIPTION">DESCRIPTION</h1>

<p>The configuration is divided into sections in an ini-like format. Every section starts with the section&#39;s name in square brackets. After that is a list of key-value pairs that specify the settings. Whitespace is purely cosmetic and doesn&#39;t change the result.</p>

<p>The &quot;global&quot; section contains the general settings applying to all of dunst. The rest of the settings can be specified via rules and can be located in any section. These rules can change a notification based on its properties. There are filtering rules and modifying rules. Filtering rules specify what notifications the rule applies to. Modifying rules specify changes to the matching notifications. Some special sections have implied filters that cannot be changed. For example, the &quot;global&quot; section has no filters: it applies to all notifications.</p>

<p>See RULES for more details.</p>

<p>All experimental settings are marked with <i>Experimental</i>.</p>

<h2 id="Global-section">Global section</h2>

<dl>

<dt id="monitor-default:-0"><b>monitor</b> (default: 0)</dt>
<dd>

<p>Specifies on which monitor the notifications should be displayed in, either by name or by number, starting from 0. See the <b>follow</b> setting.</p>

</dd>
<dt id="follow-values:-none-mouse-keyboard-default:-none"><b>follow</b> (values: [none/mouse/keyboard] default: none)</dt>
<dd>

<p>Defines where the notifications should be placed in a multi-monitor setup. All values except <i>none</i> override the <b>monitor</b> setting.</p>

<p>On Wayland there is no difference between mouse and keyboard focus. When either of them is used, the compositor will choose an output. This will generally be the output last interacted with.</p>

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
<dt id="enable_posix_regex-default:-false"><b>enable_posix_regex</b> (default: false)</dt>
<dd>

<p>When set to true (recommended), you can use POSIX regular expressions for filtering rules. It uses the POSIX Extended Regular Expression syntax: https://en.m.wikibooks.org/wiki/Regular_Expressions/POSIX-Extended_Regular_Expressions.</p>

<p>If this is set to false (not recommended), dunst will use fnmatch(3) for matching strings. Dunst doesn&#39;t pass any flags to fnmatch, so you cannot make use of extended patterns.</p>

<p>The POSIX syntax is more powerful and will eventually become the default. The main differences between POSIX and fnmatch(3) is that POSIX uses &quot;.*&quot; for wildcards instead of &quot;*&quot; and POSIX allows for partial matches without needing wildcards. This means that the pattern &quot;abc&quot; will match all strings that contain &quot;abc&quot;, like &quot;abcdef&quot;.</p>

</dd>
<dt id="geometry-DEPRECATED"><b>geometry</b> DEPRECATED</dt>
<dd>

<p>This setting is deprecated and removed. It&#39;s split up into <b>width</b>, <b>height</b>, <b>origin</b>, <b>notification_limit</b> and <b>offset</b>. For quickly transitioning to the new syntax, you can take the numbers from your old geometry config as follows: geometry = &lt;width&gt;x&lt;height&gt;+&lt;offset&gt;</p>

<p>In the new config you can then set the following variables (make sure to remove any negative signs)</p>

<pre><code>width = &lt;width&gt;
height = &lt;height&gt;
offset = &lt;offset&gt;
origin = top-right # or top-left, or any other direction you prefer</code></pre>

</dd>
<dt id="width"><b>width</b></dt>
<dd>

<p>The width of the notification window in pixels. This can be a single number to specify a constant width or two numbers for the minimum and maximum width. The notification will expand from the minimum width as neccesary.</p>

<p>Examples:</p>

<pre><code>width = 300      # constant width of 300
width = (0, 300) # width between 0 and 300</code></pre>

<p>When setting a width bigger than the screen, dunst will clamp the width to the screen width. So if you want the notifcation to stretch the entire screen dynamically, you may set the width to a high enough number, which none of your screens exceed (e.g. 10000).</p>

</dd>
<dt id="height"><b>height</b></dt>
<dd>

<p>The height of each notification in pixels. This can be a single number to specify a constant height or two numbers for the minimum and maximum width. The notification will expand from the minimum height as neccesary.</p>

<p>Examples:</p>

<pre><code>height = 300      # constant height of 300
height = (0, 300) # height between 0 and 300</code></pre>

<p>Note that unlike width, different notifications can have diffrent height values.</p>

<p>Dunst v1.11 and older do not support a dynamic height and <b>height</b> accepts a single value whose behaviour is equivalent to (0, value).</p>

</dd>
<dt id="notification_limit-default:-20"><b>notification_limit</b> (default: 20)</dt>
<dd>

<p>The number of notifications that can appear at one time. When this limit is reached any additional notifications will be queued and displayed when the currently displayed ones either time out or are manually dismissed. The value 0 means no limit. If <b>indicate_hidden</b> is true, then the specified limit is reduced by 1 and the last notification is a message informing how many hidden notifications are waiting to be displayed. See the <b>indicate_hidden</b> entry for more information.</p>

</dd>
<dt id="origin-default:-top-right"><b>origin</b> (default: top-right)</dt>
<dd>

<p>The origin of the notification window on the screen. It can then be moved with offset. Origin can be one of:</p>

<pre><code>top-left
top-center
top-right
bottom-left
bottom-center
bottom-right
left-center
center
right-center</code></pre>

</dd>
<dt id="offset-format:-horizontal-vertical"><b>offset</b> format: (horizontal, vertical)</dt>
<dd>

<p>Respectively the horizontal and vertical offset in pixels from the corner of the screen specified by <b>origin</b>. A negative offset will lead to the notification being off screen.</p>

<p>Examples:</p>

<pre><code>origin = top-right
offset = (10, 300) # a margin of 10 pixels from the right and 300 pixels from the top</code></pre>

<p>Dunst v1.11 and older use the syntax NxN instead (X offset x Y offset). For backwards compatibility this syntax is also accepted.</p>

<pre><code>offset = 10x300</code></pre>

</dd>
<dt id="scale-default:-0-X11-only"><b>scale</b> (default: 0, X11 only)</dt>
<dd>

<p>Specifies a scale factor for dimensions to adapt notifications to HiDPI screens. This scales the notification geometry and it&#39;s contents. It is not recommended to use a fractional scaling factor, as this may result in things being one pixel off. Try to use a whole number scaling factor and adjust the font size and other sizes as needed. If 0 is specified, the scale factor is auto-detected.</p>

</dd>
<dt id="progress_bar-values:-true-false-default:-true"><b>progress_bar</b> (values: [true/false], default: true)</dt>
<dd>

<p>When an integer value is passed to dunst as a hint (see NOTIFY-SEND), a progress bar will be drawn at the bottom of the notification. This behavior can be turned off by setting this setting to false.</p>

</dd>
<dt id="progress_bar_horizontal_alignment-values:-left-center-right-default:-center"><b>progress_bar_horizontal_alignment</b> (values: [left/center/right], default: center)</dt>
<dd>

<p>Horizontal alignment of the progress bar. The progress bar will always keep a distance of <b>horizontal_padding</b> from the edge of the notification.</p>

</dd>
<dt id="progress_bar_height-default:-10"><b>progress_bar_height</b> (default: 10)</dt>
<dd>

<p>The height of the progress bar in pixel. This includes the frame. Make sure this value is bigger than twice the frame width.</p>

</dd>
<dt id="progress_bar_min_width-default:-150"><b>progress_bar_min_width</b> (default: 150)</dt>
<dd>

<p>The minimum width of the progress bar in pixels. The notification is rescaled to fit the bar.</p>

</dd>
<dt id="progress_bar_max_width-default:-300"><b>progress_bar_max_width</b> (default: 300)</dt>
<dd>

<p>The maximum width of the progress bar in pixels. The notification is resized to fit the progress bar.</p>

</dd>
<dt id="progress_bar_frame_width-default:-1"><b>progress_bar_frame_width</b> (default: 1)</dt>
<dd>

<p>The frame width of the progress bar in pixels. This value should be smaller than half of the progress bar height.</p>

</dd>
<dt id="progress_bar_corner_radius-default:-0"><b>progress_bar_corner_radius</b> (default: 0)</dt>
<dd>

<p>The corner radius of the progress bar in pixels. Gives the progress bar rounded corners. Set to 0 to disable.</p>

<p>This setting will be ignored if <b>progress_bar_corners</b> is set to none.</p>

</dd>
<dt id="progress_bar_corners-default:-all"><b>progress_bar_corners</b> (default: all)</dt>
<dd>

<p>Define which corners to round when drawing the progress bar. If progress_bar_corner_radius is set to 0 this option will be ignored.</p>

<p>See the <b>corners</b> setting for the value format.</p>

</dd>
<dt id="icon_corner_radius-default:-0"><b>icon_corner_radius</b> (default: 0)</dt>
<dd>

<p>The corner radius of the icon image in pixels. Gives the icon rounded corners. Set to 0 to disable.</p>

<p>This setting will be ignored if <b>icon_corners</b> is set to none.</p>

</dd>
<dt id="icon_corners-default:-all"><b>icon_corners</b> (default: all)</dt>
<dd>

<p>Define which corners to round when drawing the icon image. If icon_corner_radius is set to 0 this option will be ignored.</p>

<p>See the <b>corners</b> setting for the value format.</p>

</dd>
<dt id="indicate_hidden-values:-true-false-default:-true"><b>indicate_hidden</b> (values: [true/false], default: true)</dt>
<dd>

<p>If this is set to true, a notification indicating how many notifications are not being displayed due to the notification limit (see <b>notification_limit</b>) will be shown <b>in place of the last notification slot</b>.</p>

<p>Meaning that if this is enabled the number of visible notifications will be 1 less than what is specified by <b>notification_limit</b>, the last slot will be taken by the hidden count.</p>

</dd>
<dt id="transparency-default:-0-X11-only"><b>transparency</b> (default: 0) (X11 only)</dt>
<dd>

<p>A 0-100 range on how transparent the notification window should be, with 0 being fully opaque and 100 invisible.</p>

<p>This will affect the whole window. To make only parts of a window transparent set the alpha channel in a color, see COLORS.</p>

<p>To make windows transparent on wayland, set the transparent part of a color, see COLORS.</p>

<p>This setting will only work if a compositor is running.</p>

</dd>
<dt id="separator_height-default:-2"><b>separator_height</b> (default: 2)</dt>
<dd>

<p>The height in pixels of the separator between notifications, if set to 0 there will be no separating line between notifications. This setting will be ignored if <b>gap_size</b> is greater than 0.</p>

</dd>
<dt id="padding-default:-8"><b>padding</b> (default: 8)</dt>
<dd>

<p>The distance in pixels from the content to the separator/border of the window in the vertical axis.</p>

</dd>
<dt id="horizontal_padding-default:-8"><b>horizontal_padding</b> (default: 8)</dt>
<dd>

<p>The distance in pixels from the content to the border of the window in the horizontal axis.</p>

</dd>
<dt id="text_icon_padding-default:-0"><b>text_icon_padding</b> (default: 0)</dt>
<dd>

<p>The distance in pixels from the text to the icon (or vice versa) in the horizontal axis.</p>

<p>Setting this to a non-zero value overwrites any padding that horizontal_padding was adding between the notification text and icon.</p>

<p>So for example setting</p>

<pre><code>text_icon_padding=10
horizontal_padding=10</code></pre>

<p>is equivalent to</p>

<pre><code>text_icon_padding=0
horizontal_padding=10</code></pre>

</dd>
<dt id="frame_width-default:-3"><b>frame_width</b> (default: 3)</dt>
<dd>

<p>Defines width in pixels of frame around the notification window. Set to 0 to disable.</p>

</dd>
<dt id="gap_size-default:-0"><b>gap_size</b> (default: 0)</dt>
<dd>

<p>Size of gap to display between notifications.</p>

<p>If value is greater than 0, <b>separator_height</b> will be ignored and a border of size <b>frame_width</b> will be drawn around each notification instead.</p>

<p>This setting requires a compositor and any applications displayed between the gaps are not currently clickable.</p>

</dd>
<dt id="separator_color-values:-auto-foreground-frame-RRGGBB-default:-frame"><b>separator_color</b> (values: [auto/foreground/frame/#RRGGBB] default: frame)</dt>
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

<p>Any other value is interpreted as a color, see COLORS.</p>

</dd>
</dl>

</dd>
<dt id="sort-values:-true-false-id-urgency_ascending-urgency_descending-update-default:-true"><b>sort</b> (values: [true/false/id/urgency_ascending/urgency_descending/update], default: true)</dt>
<dd>

<p>If set to true or urgency_descending, display notifications with higher urgency above the others. critical first, then normal, then low.</p>

<p>If set to false or id, sort notifications by id.</p>

<p>If set to urgency_ascending, notifications are sorted by urgency, low first, then normal, then critical.</p>

<p>If set to update, notifications are sorted by their update_time. So the most recent is always at the top. This means that if you set sort to update, and stack_duplicates to true, the duplicate will always be at the top.</p>

<p>When the notification window is at the bottom of the screen, this order is automatically reversed.</p>

</dd>
<dt id="idle_threshold-default:-0"><b>idle_threshold</b> (default: 0)</dt>
<dd>

<p>Don&#39;t timeout notifications if user is idle longer than this time. See TIME FORMAT for valid times.</p>

<p>Set to 0 to disable.</p>

<p>A client can mark a notification as transient to bypass this setting and timeout anyway. Use a rule with &#39;set_transient = no&#39; to disable this behavior.</p>

<p>Note: this doesn&#39;t work on xwayland.</p>

</dd>
<dt id="layer-values:-bottom-top-overlay-default:-overlay-Wayland-only"><b>layer</b> (values: [bottom/top/overlay], default: overlay) (Wayland only)</dt>
<dd>

<p>Place dunst notifications on the selected layer. Using overlay will cause notifications to be displayed above fullscreen windows, though this may also occur at top depending on your compositor.</p>

<p>The bottom layer is below all windows and above the background.</p>

</dd>
<dt id="force_xwayland-values:-true-false-default:-false-Wayland-only"><b>force_xwayland</b> (values: [true/false], default: false) (Wayland only)</dt>
<dd>

<p>Force the use of X11 output, even on a wayland compositor. This setting has no effect when not using a Wayland compositor.</p>

<p>This setting will be ignored if dunst was compiled without X11 support.</p>

</dd>
<dt id="font-default:-Monospace-8"><b>font</b> (default: &quot;Monospace 8&quot;)</dt>
<dd>

<p>Defines the font or font set used. Optionally set the size as a decimal number after the font name and space. Multiple font options can be separated with commas.</p>

<p>This options is parsed as a Pango font description. More information on the string format can be found here https://docs.gtk.org/Pango/type_func.FontDescription.from_string.html.</p>

</dd>
<dt id="line_height-default:-0"><b>line_height</b> (default: 0)</dt>
<dd>

<p>The amount of extra spacing between text lines in pixels. Set to 0 to disable.</p>

</dd>
<dt id="format-default:-b-s-b-n-b"><b>format</b> (default: &quot;&lt;b&gt;%s&lt;/b&gt;\n%b&quot;)</dt>
<dd>

<p>Specifies how the various attributes of the notification should be formatted on the notification window.</p>

<p>Regardless of the status of the <b>markup</b> setting, any markup tags that are present in the format will be parsed. Note that because of that, if a literal ampersand (&amp;) is needed it needs to be escaped as &#39;&amp;amp;&#39;</p>

<p>If &#39;\n&#39; is present anywhere in the format, it will be replaced with a literal newline.</p>

<p>If any of the following strings are present, they will be replaced with the equivalent notification attribute.</p>

<p>For a complete markup reference, see &lt;https://docs.gtk.org/Pango/pango_markup.html&gt;.</p>

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
<dt id="vertical_alignment-values:-top-center-bottom-default:-center"><b>vertical_alignment</b> (values: [top/center/bottom], default: center)</dt>
<dd>

<p>Defines how the text and icon should be aligned vertically within the notification.</p>

</dd>
<dt id="show_age_threshold-default:-60"><b>show_age_threshold</b> (default: 60)</dt>
<dd>

<p>Show age of message if message is older than this time. See TIME FORMAT for valid times.</p>

<p>Set to -1 to disable.</p>

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
<dt id="hide_duplicate_count-values:-true-false-default:-false"><b>hide_duplicate_count</b> (values: [true/false], default: false)</dt>
<dd>

<p>Hide the count of stacked duplicate notifications.</p>

</dd>
<dt id="show_indicators-values:-true-false-default:-true"><b>show_indicators</b> (values: [true/false], default: true)</dt>
<dd>

<p>Show an indicator if a notification contains actions and/or open-able URLs. See ACTIONS below for further details.</p>

</dd>
<dt id="icon_path-default:-usr-share-icons-gnome-16x16-status-:-usr-share-icons-gnome-16x16-devices"><b>icon_path</b> (default: &quot;/usr/share/icons/gnome/16x16/status/:/usr/share/icons/gnome/16x16/devices/&quot;)</dt>
<dd>

<p>Can be set to a colon-separated list of paths to search for icons to use with notifications.</p>

<p>Dunst doens&#39;t search outside of these direcories. For a recursive icon lookup system, see <b>enable_recursive_icon_lookup</b>. This new system will eventually replace icon_path search.</p>

</dd>
<dt id="icon_theme-default:-Adwaita-example:-Adwaita-breeze"><b>icon_theme</b> (default: &quot;Adwaita&quot;, example: &quot;Adwaita, breeze&quot;)</dt>
<dd>

<p>Comma-separated list of names of the themes to use for looking up icons. This has to be the name of the directory in which the theme is located, not the human-friendly name of the theme. So for example, the theme <b>Breeze Dark</b> is located in <i>/usr/share/icons/breeze-dark</i>. In this case you have to set the theme to <b>breeze-dark</b>.</p>

<p>The first theme in the list is the most important. Only if the icon cannot be found in that theme, the next theme will be tried.</p>

<p>Dunst will look for the themes in <b>XDG_DATA_HOME/icons</b> and <b>$XDG_DATA_DIRS/icons</b> as specified in the icon theme specification: https://specifications.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html.</p>

<p>If the theme inherits from other themes, they will be used as a backup.</p>

<p>This setting is experimental and not enabled by default. See <b>enable_recursive_icon_lookup</b> for how to enable it.</p>

</dd>
<dt id="enable_recursive_icon_lookup-default:-false"><b>enable_recursive_icon_lookup</b> (default: false)</dt>
<dd>

<p>This setting enables the new icon lookup method. This new system will eventually be the old icon lookup.</p>

<p>Currently icons are looked up in the <b>icon_path</b>. Since the <b>icon_path</b> wasn&#39;t recursive, one had to add a ton of paths to this list. This has been drastically simplified by the new lookup method. Now you only have to set <b>icon_theme</b> to the name of the theme you want. To enable this new behaviour, set <b>enable_recursive_icon_lookup</b> to true in the <i>[global]</i> section. See the respective settings for more details.</p>

</dd>
<dt id="sticky_history-values:-true-false-default:-true"><b>sticky_history</b> (values: [true/false], default: true)</dt>
<dd>

<p>If set to true, notifications that have been recalled from history will not time out automatically.</p>

</dd>
<dt id="history_length-default:-20"><b>history_length</b> (default: 20)</dt>
<dd>

<p>Maximum number of notifications that will be kept in history. After that limit is reached, older notifications will be deleted once a new one arrives. See HISTORY.</p>

</dd>
<dt id="dmenu-default:-usr-bin-dmenu--p-dunst"><b>dmenu</b> (default: &quot;/usr/bin/dmenu -p dunst&quot;)</dt>
<dd>

<p>The command that will be run when opening the context menu. Should be either a dmenu command or a dmenu-compatible menu.</p>

</dd>
<dt id="browser-default:-usr-bin-xdg-open"><b>browser</b> (default: &quot;/usr/bin/xdg-open&quot;)</dt>
<dd>

<p>The command that will be run when opening a URL. The URL to be opened will be appended to the end of the value of this setting.</p>

</dd>
<dt id="always_run_script-values:-true-false-default:-true"><b>always_run_script</b> (values: [true/false] default: true]</dt>
<dd>

<p>Always run rule-defined scripts, even if the notification is suppressed with <code>format = &quot;&quot;</code>. See SCRIPTING.</p>

</dd>
<dt id="title-default:-Dunst-X11-only"><b>title</b> (default: &quot;Dunst&quot;) (X11 only)</dt>
<dd>

<p>Defines the title (<i>_NET_WM_NAME</i> property) of notification windows spawned by dunst.</p>

<p>There should be no need to modify this setting for regular use.</p>

</dd>
<dt id="class-default:-Dunst-X11-only"><b>class</b> (default: &quot;Dunst&quot;) (X11 only)</dt>
<dd>

<p>Defines the class (<i>WM_CLASS</i> first part) of notification windows spawned by dunst.</p>

<p>There should be no need to modify this setting for regular use.</p>

</dd>
<dt id="force_xinerama-values:-true-false-default:-false-X11-only"><b>force_xinerama</b> (values: [true/false], default: false) (X11 only)</dt>
<dd>

<p>Use the Xinerama extension instead of RandR for multi-monitor support. This setting is <i>provided for compatibility</i> with older nVidia drivers that do not support RandR and using it on systems that support RandR is <i>highly discouraged</i>.</p>

<p>By enabling this setting dunst will not be able to detect when a monitor is connected or disconnected which might break follow mode if the screen layout changes.</p>

</dd>
<dt id="corner_radius-default:-0"><b>corner_radius</b> (default: 0)</dt>
<dd>

<p>Define the corner radius in pixels. A corner radius of 0 will result in rectangular shaped notifications.</p>

<p>By enabling this setting the outer border and the frame will be shaped. If you have multiple notifications, the whole window is shaped, not every single notification, unless if gaps are enabled (see <b>gaps_size</b>).</p>

<p>To avoid the corners clipping the icon or text the corner radius will be automatically lowered to half of the notification height if it exceeds it.</p>

<p>This setting will be ignored if <b>corners</b> is set to none.</p>

</dd>
<dt id="corners-values:-none-all-bottom-right-bottom-left-top-right-top-left-top-bottom-left-right-default:-all"><b>corners</b> (values: [none/all/bottom-right/bottom-left/top-right/top-left/top/bottom/left/right], default: all)</dt>
<dd>

<p>Comma-separated list of the corners to round when drawing the window.</p>

<p>If the corner radius is set to 0 this option will be ignored.</p>

</dd>
<dt id="mouse_-left-middle-right-_click-values:-none-do_action-close_current-close_all-context-context_all"><b>mouse_[left/middle/right]_click</b> (values: [none/do_action/close_current/close_all/context/context_all])</dt>
<dd>

<p>Defines action of mouse click. A touch input in Wayland acts as a mouse left click. A list of values, separated by commas, can be specified for multiple actions to be executed in sequence.</p>

<p><b>Defaults:</b></p>

<ul>

<li><p><code>mouse_left_click=close_current</code></p>

</li>
<li><p><code>mouse_middle_click=do_action, close_current</code></p>

</li>
<li><p><code>mouse_right_click=close_all</code></p>

</li>
</ul>

<dl>

<dt id="none1"><b>none</b></dt>
<dd>

<p>Don&#39;t do anything.</p>

</dd>
<dt id="do_action"><b>do_action</b></dt>
<dd>

<p>Invoke the action determined by the action_name rule. If there is no such action, open the context menu.</p>

</dd>
<dt id="open_url"><b>open_url</b></dt>
<dd>

<p>If the notification has exactly one url, open it. If there are multiple ones, open the context menu.</p>

</dd>
<dt id="close_current"><b>close_current</b></dt>
<dd>

<p>Close current notification.</p>

</dd>
<dt id="close_all"><b>close_all</b></dt>
<dd>

<p>Close all notifications.</p>

</dd>
<dt id="context"><b>context</b></dt>
<dd>

<p>Open context menu for the notification.</p>

</dd>
<dt id="context_all"><b>context_all</b></dt>
<dd>

<p>Open context menu for all notifications.</p>

</dd>
</dl>

</dd>
<dt id="ignore_dbusclose-default:-false"><b>ignore_dbusclose</b> (default: false)</dt>
<dd>

<p>Ignore the dbus <i>CloseNotification</i> message. This is useful to enforce the timeout set by dunst configuration. Without this parameter, an application may close the notification sent before the user defined timeout.</p>

</dd>
<dt id="override_pause_level-values:-0-100-default:-0"><b>override_pause_level</b> (values: [0-100], default: 0)</dt>
<dd>

<p>A notification will appear whenever notification&#39;s <i>override_pause_level</i> is greater than the paused level. Setting this to values other than 0 allows you to create partial pause modes, where more urgent notifications get through, but less urgent stay paused.</p>

<p>For example, when you can set a low battery noficiation&#39;s override_pause_level to 60 and then set dunst&#39;s pause level to 60. This will cause dunst to only show battery level notification (and other notifications with override_pause_level &gt;= 60), while suspending others.</p>

</dd>
</dl>

<h2 id="Keyboard-shortcuts-X11-only">Keyboard shortcuts (X11 only)</h2>

<p>Keyboard shortcuts are defined in the following format: &quot;Modifier+key&quot; where the modifier is one of ctrl,mod1,mod2,mod3,mod4 and key is any keyboard key.</p>

<p>Note that the keyboard shortcuts have been moved to the <b>global</b> section of the config for consistency with other settings.</p>

<p>Alternatively you can also define shortcuts inside your window manager and bind them to dunstctl(1) commands.</p>

<p>Wayland does not allow applications to listen to global keyboard events, so this feature can be implemented only for X.</p>

<dl>

<dt id="close"><b>close</b></dt>
<dd>

<p>Specifies the keyboard shortcut for closing a notification.</p>

</dd>
<dt id="close_all1"><b>close_all</b></dt>
<dd>

<p>Specifies the keyboard shortcut for closing all currently displayed notifications.</p>

</dd>
<dt id="history"><b>history</b></dt>
<dd>

<p>Specifies the keyboard shortcut for recalling a single notification from history.</p>

</dd>
<dt id="context1"><b>context</b></dt>
<dd>

<p>Specifies the keyboard shortcut that opens the context menu.</p>

</dd>
</dl>

<h2 id="Urgency-sections">Urgency sections</h2>

<p>The urgency sections work in a similar way to rules and can be used to specify attributes for the different urgency levels of notifications (low, normal, critical). Currently only the background, foreground, hightlight, timeout, frame_color and icon attributes can be modified.</p>

<p>The urgency sections are urgency_low, urgency_normal, urgency_critical for low, normal and critical urgency respectively.</p>

<p>See the example configuration file for examples.</p>

<p>Old version of dunst allowed changing the colors of different urgencies through command line options. This has been long removed in favour of RULES, see issue #328.</p>

<h1 id="DUNSTCTL">DUNSTCTL</h1>

<p>Dunst now contains a command line control command that can be used to interact with it. It supports all functions previously done only via keyboard shortcuts but also has a lot of extra functionality. For more information, see dunstctl(1).</p>

<h1 id="HISTORY">HISTORY</h1>

<p>Dunst saves a number of notifications (specified by <b>history_length</b>) in memory. These notifications can be recalled (i.e. redisplayed) by calling <b>dunstctl history</b> (see dunstctl(1)). Whether these notifications will time out like if they have been just send depends on the value of the <b>sticky_history</b> setting. Actions are invalidated once the notification is closed, so you cannot execute that action when you bring back a notification from history.</p>

<p>Past notifications are redisplayed in a first-in-last-out order, meaning that pressing the history key once will bring up the most recent notification that had been closed/timed out.</p>

<h1 id="WAYLAND">WAYLAND</h1>

<p>Dunst has Wayland support since version 1.6.0. Because the Wayland protocol is more focused on security, some things that are possible in X11 are not possible in Wayland. Those differences are reflected in the configuration. The main things that change are that dunst on Wayland cannot use global hotkeys, use dunstctl instead.</p>

<p>Some dunst features on Wayland might need your compositor to support a certain protocol. Dunst will warn you if an optional feature isn&#39;t supported and will disable the corresponding functionality.</p>

<p>Fullscreen detection works on wayland with some limitations (see <b>fullscreen</b>). If you want notifications to appear over fullscreen windows, set <b>layer = overlay</b> in the global options.</p>

<p>Note that the same limitations exist when using XWayland.</p>

<p>If something doesn&#39;t quite work in Wayland, please file a bug report. In the mean time, you can try if the X11 output does work on wayland. Use <b>force_xwayland = true</b> for that.</p>

<p>If you have your dunst notifications on the same side of your display as your status bar, you might notice that your notifications appear a bit higher or lower than on X11. This is because the notification cannot be placed on top of your status bar. The notifications are placed relative to your status bar, making them appear higher or lower by the height of your status bar. We cannot do anything about that behavior.</p>

<p>Note that dunst creates a &quot;desktop layer&quot; using the layer shell protocol and not a regular Wayland window. This has some limitations like stated above. For example you can&#39;t set a window title/class.</p>

<h1 id="RULES">RULES</h1>

<p>Rules allow the conditional modification of notifications. They can be located in a section with any name, even the special sections. The special sections do not allow filters to be added, since they have implied filters by default.</p>

<dl>

<dt id="global">&#39;global&#39;</dt>
<dd>

<p>No filters, matches all notifications.</p>

</dd>
<dt id="urgency_low-urgency_normal-and-urgency_critical">&#39;urgency_low&#39;, &#39;urgency_normal&#39; and &#39;urgency_critical&#39;</dt>
<dd>

<p>Matches low, normal or critical urgency respectively.</p>

</dd>
</dl>

<p>There are 2 parts in configuring a rule: Defining the filters that controls when a rule should apply and then the actions that should be taken when the rule is matched. It&#39;s also possible to not specify any filters, in which case the rule will match all notifications.</p>

<p>Rules are applied in order of appearance. Beware: if a notification is changed by a rule, it may affect if it&#39;s being matched by a later rule.</p>

<dl>

<dt id="filtering"><b>filtering</b></dt>
<dd>

<p>With filtering rules you can match notifications to apply rules to only a subset of notifications.</p>

<p>For filtering rules that filter based on strings you can use regular expressions. It&#39;s recommended to set <b>enable_posix_regex</b> to true. You can then use the POSIX Extended Regular Expression syntax: https://en.m.wikibooks.org/wiki/Regular_Expressions/POSIX-Extended_Regular_Expressions.</p>

<p>A matching rule is made by assigning a filter attribute to the value you want to match. Shell-like globbing is supported when matching values.</p>

<p>If multiple filter expressions are present, all of them have to match for the rule to be applied (logical AND).</p>

<p>An example of rule that only operates on messages sent by notify-send is:</p>

<pre><code>appname=&quot;notify-send&quot;</code></pre>

<p>The allowed attributes are listed below.</p>

<dl>

<dt id="appname-discouraged-see-desktop_entry"><code>appname</code> (discouraged, see desktop_entry)</dt>
<dd>

<p>The name of the application as reported by the client. Be aware that the name can often differ depending on the locale used.</p>

<p>It&#39;s recommended to use the <code>desktop_entry</code> filter instead.</p>

</dd>
<dt id="body"><code>body</code></dt>
<dd>

<p>The body of the notification</p>

</dd>
<dt id="category"><code>category</code></dt>
<dd>

<p>The category of the notification as defined by the notification spec. See https://specifications.freedesktop.org/notification-spec/latest/categories.html.</p>

</dd>
<dt id="desktop_entry"><code>desktop_entry</code></dt>
<dd>

<p>GLib based applications export their desktop-entry name. In comparison to the appname, the desktop-entry won&#39;t get localized.</p>

</dd>
<dt id="icon"><code>icon</code></dt>
<dd>

<p>The icon of the notification in the form of a file path. Can be empty if no icon is available or a raw icon is used instead. This setting is not to be confused with the icon setting in the urgency section.</p>

</dd>
<dt id="match_transient"><code>match_transient</code></dt>
<dd>

<p>Match if the notification has been declared as transient by the client or by some other rule.</p>

<p>See <code>set_transient</code> for more details about this attribute.</p>

</dd>
<dt id="match_dbus_timeout"><code>match_dbus_timeout</code></dt>
<dd>

<p>Matches the dbus timeout of the notification as set by the client or by some other rule.</p>

<p>See <code>override_dbus_timeout</code> for more details about this attribute.</p>

</dd>
<dt id="msg_urgency"><code>msg_urgency</code></dt>
<dd>

<p>Matches the urgency of the notification as set by the client or by some other rule.</p>

<p>It is named so to not conflict with trying to modify the urgency.</p>

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

</dd>
<dt id="modifying"><b>modifying</b></dt>
<dd>

<p>A modifying rule, similarly to a filtering one, is made by assigning a value to a notification attribute in the rule definition.</p>

<p>The following attributes can be overridden:</p>

<dl>

<dt id="background"><code>background</code></dt>
<dd>

<p>The background color of the notification. See COLORS for possible values.</p>

</dd>
<dt id="foreground1"><code>foreground</code></dt>
<dd>

<p>The foreground color of the notification. See COLORS for possible values.</p>

</dd>
<dt id="highlight"><code>highlight</code></dt>
<dd>

<p>The highlight color of the notification. This color is used for coloring the progress bar. See COLORS for possible values.</p>

<p>You can also set additional color values (as a comma-separated list) to define a linear gradient spanning all the length of the progress bar.</p>

</dd>
<dt id="format"><code>format</code></dt>
<dd>

<p>Equivalent to the <code>format</code> setting.</p>

</dd>
<dt id="frame_color"><code>frame_color</code></dt>
<dd>

<p>The frame color color of the notification. See COLORS for possible values.</p>

</dd>
<dt id="fullscreen-values:-delay-show-pushback-default:-show"><code>fullscreen</code> (values: [delay/show/pushback], default: show)</dt>
<dd>

<p>This attribute specifies how notifications are handled if a fullscreen window is focused. By default it&#39;s set to show so notifications are being shown.</p>

<p>Other possible values are delay: Already shown notifications are continued to be displayed until they are dismissed or time out but new notifications will be held back and displayed when the focus to the fullscreen window is lost.</p>

<p>Or pushback which is equivalent to delay with the difference that already existing notifications are paused and hidden until the focus to the fullscreen window is lost.</p>

<p>On Wayland, if <b>follow</b> is set to mouse or keyboard, the output where the notification is located cannot be determined. So dunst will delay or pushback if any of the outputs is fullscreen. Since the fullscreen protocol is fairly new, you will need a recent version of a compositor that supports it. At the time of writing, you will need the git version of sway. See also <b>layer</b> to change if notifications appear above fullscreen windows in Wayland.</p>

</dd>
<dt id="min_icon_size-default:-32"><code>min_icon_size</code> (default: 32)</dt>
<dd>

<p>Defines the minimum size in pixels for the icons. If the icon is larger than or equal to the specified value it won&#39;t be affected. If it&#39;s smaller then it will be scaled up so that the smaller axis is equivalent to the specified size.</p>

<p>When using recursive icon lookup (see <b>enable_recursive_icon_lookup</b>), all icons from a theme will be this size.</p>

<p>If <b>icon_position</b> is set to off, this setting is ignored.</p>

</dd>
<dt id="max_icon_size-default:-128"><code>max_icon_size</code> (default: 128)</dt>
<dd>

<p>Defines the maximum size in pixels for the icons. If the icon is smaller than or equal to the specified value it won&#39;t be affected. If it&#39;s larger then it will be scaled down so that the larger axis is equivalent to the specified size.</p>

<p>Set to 0 to disable icon downscaling.</p>

<p>If both <b>min_icon_size</b> and <b>max_icon_size</b> are enabled, the latter gets the last say.</p>

<p>If <b>icon_position</b> is set to off, this setting is ignored.</p>

</dd>
<dt id="new_icon"><code>new_icon</code></dt>
<dd>

<p>Updates the icon of the notification, it should be a path or a name for a valid image. This overrides the icon that was sent with dunstify or another notification tool. Expansion of the argument is carried out using wordexp(3) with command substitution disabled.</p>

</dd>
<dt id="icon_position-values:-left-right-top-off-default:-left"><code>icon_position</code> (values: [left/right/top/off], default: left)</dt>
<dd>

<p>Defines the position of the icon in the notification window. Setting it to off disables icons.</p>

</dd>
<dt id="default_icon"><code>default_icon</code></dt>
<dd>

<p>Sets the default icon of the notification, it should be a path or a name for a valid image. This does <b>not</b> override the icon that was sent with dunstify or another notification tool. Expansion of the argument is carried out using wordexp(3) with command substitution disabled.</p>

</dd>
<dt id="set_stack_tag"><code>set_stack_tag</code></dt>
<dd>

<p>Sets the stack tag for the notification, notifications with the same (non-empty) stack tag and the same appid will replace each-other so only the newest one is visible. This can be useful for example in volume or brightness notifications where you only want one of the same type visible.</p>

<p>The stack tag can be set by the client with the &#39;synchronous&#39;, &#39;private-synchronous&#39; &#39;x-canonical-private-synchronous&#39; or the &#39;x-dunst-stack-tag&#39; hints.</p>

</dd>
<dt id="set_transient"><code>set_transient</code></dt>
<dd>

<p>Sets whether the notification is considered transient. Transient notifications will bypass the idle_threshold setting.</p>

<p>By default notifications are _not_ considered transient but clients can set the value of this by specifying the &#39;transient&#39; hint when sending notifications.</p>

</dd>
<dt id="set_category"><code>set_category</code></dt>
<dd>

<p>Sets the category of the notification. For a list of standard categories see https://specifications.freedesktop.org/notification-spec/latest/categories.html.</p>

</dd>
<dt id="timeout"><code>timeout</code></dt>
<dd>

<p>Equivalent to the <code>timeout</code> setting in the urgency sections.</p>

</dd>
<dt id="override_dbus_timeout"><code>override_dbus_timeout</code></dt>
<dd>

<p>Overrides the timeout specified in dbus. This takes precedence over <code>timeout</code>.</p>

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
<dt id="history_ignore"><code>history_ignore</code></dt>
<dd>

<p>Setting this to true will display the notification initially, but stop it from being recalled via the history.</p>

</dd>
<dt id="action_name-default:-default"><code>action_name</code> (default: &quot;default&quot;)</dt>
<dd>

<p>Sets the name of the action to be invoked on do_action. If not specified, the action set as default action or the only available action will be invoked.</p>

</dd>
<dt id="word_wrap-values:-true-false-default:-true"><code>word_wrap</code> (values: [true/false], default: true)</dt>
<dd>

<p>Specifies whether to wrap the text if the lines get longer than the maximum notification width. If it&#39;s set to true, long lines will be broken into multiple lines expanding the notification window height as necessary for them to fit. If the text doesn&#39;t fit in the window, it will be ellipsize according to ellipsize.</p>

</dd>
<dt id="ellipsize-values:-start-middle-end-default:-middle"><code>ellipsize</code> (values: [start/middle/end], default: middle)</dt>
<dd>

<p>Specifies where truncated lines should be ellipsized.</p>

</dd>
<dt id="alignment-values:-left-center-right-default:-left"><code>alignment</code> (values: [left/center/right], default: left)</dt>
<dd>

<p>Defines how the text should be aligned within the notification.</p>

</dd>
<dt id="hide_text-values:-true-false-default:-false"><code>hide_text</code> (values: [true/false], default: false)</dt>
<dd>

<p>Setting this to true will skip displaying any text related to the notification. The notification icon and progress bar will still be displayed. This option may be useful for notifications where an icon or progress bar may be sufficient information for the notification, such as audio volume or brightness level.</p>

</dd>
<dt id="markup-values:-full-strip-no-default:-no"><code>markup</code> (values: [full/strip/no], default: no)</dt>
<dd>

<p>Defines how markup in notifications is handled.</p>

<p>It&#39;s important to note that markup in the format option will be parsed regardless of what this is set to.</p>

<p>Possible values:</p>

<dl>

<dt id="full"><b>full</b></dt>
<dd>

<p>Allow a small subset of html markup in notifications</p>

<pre><code>&lt;b&gt;bold&lt;/b&gt;
&lt;i&gt;italic&lt;/i&gt;
&lt;s&gt;strikethrough&lt;/s&gt;
&lt;u&gt;underline&lt;/u&gt;</code></pre>

<p>For a complete reference see https://docs.gtk.org/Pango/pango_markup.html.</p>

</dd>
<dt id="strip"><b>strip</b></dt>
<dd>

<p>This setting is provided for compatibility with some broken clients that send markup even though it&#39;s not enabled on the server.</p>

<p>Dunst will try to strip the markup but the parsing is simplistic so using this option outside of matching rules for specific applications <b>IS GREATLY DISCOURAGED</b>.</p>

<p>See RULES for matching specific broken clients.</p>

</dd>
<dt id="no"><b>no</b></dt>
<dd>

<p>Disable markup parsing, incoming notifications will be treated as plain text. Dunst will not advertise that it can parse markup if this is set as a global setting.</p>

</dd>
</dl>

</dd>
</dl>

</dd>
</dl>

<h2 id="SCRIPTING">SCRIPTING</h2>

<p>Within rules you can specify a script to be run every time the rule is matched by assigning the &#39;script&#39; option to the name of the script to be run.</p>

<p>When the script is called details of the notification that triggered it will be passed via environment variables. The following variables are available: <b>DUNST_APP_NAME</b>, <b>DUNST_SUMMARY</b>, <b>DUNST_BODY</b>, <b>DUNST_ICON_PATH</b>, <b>DUNST_URGENCY</b>, <b>DUNST_ID</b>, <b>DUNST_PROGRESS</b>, <b>DUNST_CATEGORY</b>, <b>DUNST_STACK_TAG</b>, <b>DUNST_URLS</b>, <b>DUNST_TIMEOUT</b>, <b>DUNST_TIMESTAMP</b>, <b>DUNST_DESKTOP_ENTRY</b>, and <b>DUNST_STACK_TAG</b>.</p>

<p>Another, less recommended way to get notifcations details from a script is via command line parameters. These are passed to the script in the following order: <b>appname</b>, <b>summary</b>, <b>body</b>, <b>icon_path</b>, <b>urgency</b>.</p>

<p>Where <b>DUNST_ICON_PATH</b> or <b>icon_path</b> is the absolute path to the icon file if there is one. <b>DUNST_URGENCY</b> or <b>urgency</b> is one of &quot;LOW&quot;, &quot;NORMAL&quot; or &quot;CRITICAL&quot;. <b>DUNST_URLS</b> is a newline-separated list of urls associated with the notification.</p>

<p>Note that some variables may be empty.</p>

<p>If the notification is suppressed, the script will not be run unless <b>always_run_script</b> is set to true.</p>

<p>The script parameter is expanded according to wordexp(3) with command substitution disabled. If the expanded value is not an absolute path, the directories in the PATH variable will be searched for an executable of the same name.</p>

<h1 id="COLORS">COLORS</h1>

<p>Colors are values with the format #RGB or #RRGGBB.</p>

<p>You may also specify a transparency component by using the format #RGBA or #RRGGBBAA.</p>

<p><b>NOTE</b>: &#39;#&#39; is interpreted as a comment, to use it the entire value needs to be quoted. For example:</p>

<pre><code>separator_color=&quot;#123456&quot;</code></pre>

<h1 id="NOTIFY-SEND-HINTS">NOTIFY-SEND HINTS</h1>

<p>Dunst is able to get different colors for a message via notify-send. In order to do that you have to add a hint via the -h option. The progress value can be set with a hint, too.</p>

<p>Note: Dunstify is compatible with notify-send and all of these settings work the same way.</p>

<p>All the accepted hints are listed below.</p>

<p>See RULES for more detailed explanations for some options.</p>

<dl>

<dt id="fgcolor"><b>fgcolor</b></dt>
<dd>

<p>Foreground color.</p>

</dd>
<dt id="bgcolor"><b>bgcolor</b></dt>
<dd>

<p>Background color.</p>

</dd>
<dt id="frcolor"><b>frcolor</b></dt>
<dd>

<p>Frame color.</p>

</dd>
<dt id="hlcolor"><b>hlcolor</b></dt>
<dd>

<p>Highlight color.</p>

</dd>
<dt id="value"><b>value</b></dt>
<dd>

<p>Progress value.</p>

</dd>
<dt id="image-path"><b>image-path</b></dt>
<dd>

<p>Icon name. This may be a path or just the icon name.</p>

</dd>
<dt id="image-data"><b>image-data</b></dt>
<dd>

<p>A stream of raw image data.</p>

</dd>
<dt id="category1"><b>category</b></dt>
<dd>

<p>The category.</p>

</dd>
<dt id="desktop-entry"><b>desktop-entry</b></dt>
<dd>

<p>The desktop entry.</p>

</dd>
<dt id="transient"><b>transient</b></dt>
<dd>

<p>The transient value.</p>

</dd>
</dl>

<p>Some examples:</p>

<pre><code>notify-send -h string:fgcolor:#ff4444

notify-send -h string:bgcolor:#4444ff -h string:fgcolor:#ff4444 -h string:frcolor:#44ff44

notify-send -h int:value:42 &quot;Working ...&quot;</code></pre>

<h1 id="ACTIONS">ACTIONS</h1>

<p>Dunst allows notifiers (i.e.: programs that send the notifications) to specify actions. Dunst has support for both displaying indicators for these, and interacting with these actions.</p>

<p>If &quot;show_indicators&quot; is true and a notification has an action, an &quot;(A)&quot; will be prepended to the notification format. Likewise, an &quot;(U)&quot; is prepended to notifications with URLs. It is possible to interact with notifications that have actions regardless of this setting, though it may not be obvious which notifications HAVE actions.</p>

<p>The &quot;context&quot; keybinding is used to interact with these actions, by showing a menu of possible actions. This feature requires &quot;dmenu&quot; or a dmenu drop-in replacement present.</p>

<p>Alternatively, you can invoke an action with a middle click on the notification. If there is exactly one associated action, or one is marked as default, that one is invoked. If there are multiple, the context menu is shown. The same applies to URLs when there are no actions.</p>

<h1 id="TIME-FORMAT">TIME FORMAT</h1>

<p>A time can be any decimal integer value suffixed with a time unit. If no unit given, seconds (&quot;s&quot;) is taken as default.</p>

<p>Time units understood by dunst are &quot;ms&quot;, &quot;s&quot;, &quot;m&quot;, &quot;h&quot; and &quot;d&quot;.</p>

<p>Example time: &quot;1000ms&quot;, &quot;10m&quot;.</p>

<h1 id="AUTHORS">AUTHORS</h1>

<p>Written by Sascha Kruse &lt;knopwob@googlemail.com&gt;.</p>

<h1 id="REPORTING-BUGS">REPORTING BUGS</h1>

<p>Bugs and suggestions should be reported on GitHub at https://github.com/dunst-project/dunst/issues.</p>

<h1 id="COPYRIGHT">COPYRIGHT</h1>

<p>Copyright 2013 Sascha Kruse and contributors (see LICENSE for licensing information).</p>

<p>If you feel that copyrights are violated, please send me an email.</p>

<h1 id="SEE-ALSO">SEE ALSO</h1>

<p>dunst(1), dunstctl(1), dmenu(1), notify-send(1), dunstify(1)</p>


</body>

</html>


