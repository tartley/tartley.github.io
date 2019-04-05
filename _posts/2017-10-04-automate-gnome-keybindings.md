---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Linux-dev, Bash]
comments: []
date: 2017-10-04 20:06:47 -0500
date_gmt: 2017-10-04 19:06:47 -0500
layout: post
published: true
status: publish
tags: []
title: Automate Gnome keybindings
wordpress_id: 1701
wordpress_url: http://tartley.com/?p=1701
---

Sick of manual GUI twiddling to fix inconsistent keybindings on various
computers. Solved once and for all, by a new script in my personal
workstation setup bucket:

Warning: This:

-   works great on RHEL,
-   doesn't all work on Ubuntu&lt;=17.04, I suspect because Unity has
    it's own set of keybinds that are defined elsewhere.
-   works great on Ubuntu 17.10. especially if you go in manually to
    disable the built-in keybinding for Super-V, which displays the
    calendar and notifications window, which shadows my 'toggle window
    maximize vertically'.

``` bash
#!/usr/bin/env bash

kb='org.gnome.desktop.wm.keybindings'

# Switcher, between windows not apps, uses alt-tab and alt-grave
gsettings set $kb switch-windows "['Tab']"
gsettings set $kb switch-windows-backward "['grave', 'Tab']"
gsettings set $kb switch-applications "[]"
gsettings set $kb switch-applications-backward "[]"

# Window maximize toggle, super-up
gsettings set $kb maximize "[]"
gsettings set $kb toggle-maximized "['Up']"

# Window maximize vertically toggle, super-v
gsettings set $kb maximize-vertically "['v']"

# run command, super-r
gsettings set $kb panel-run-dialog "['r', 'F2']"


# Custom commands

mk='org.gnome.settings-daemon.plugins.media-keys'
ckb='/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings'

gsettings set $mk custom-keybindings "['$ckb/custom0/', '$ckb/custom1/']"

gsettings set $mk.custom-keybinding:$ckb/custom0/ name "screen off"
gsettings set $mk.custom-keybinding:$ckb/custom0/ command "screenoff"
gsettings set $mk.custom-keybinding:$ckb/custom0/ binding "z"

gsettings set $mk.custom-keybinding:$ckb/custom1/ name "terminal"
gsettings set $mk.custom-keybinding:$ckb/custom1/ command "terminal"
gsettings set $mk.custom-keybinding:$ckb/custom1/ binding "t"
```

Embedded in that is the ultimate solution to my longstanding irk with
Unity and Gnome's default window switcher (alt-tab.) By default it
groups windows of a single application together, requiring some extra
-grave pressing to navigate between windows within an application.

This not only requires way more effort, but also breaks the expected
behaviour of just tapping alt-tab to go back to the last used window.
Instead it goes back to the last used application, so you can't toggle
between two windows of the same application, eg. two terminals. Absolute
madness.

The above modifies alt-tab to just cycle through all windows, ungrouped,
which fixes the ability to toggle between last two windows. Also,
alt-grave is provided as an alternative to cycle backwards through the
windows, which is easier to hit than shift-alt-tab.
