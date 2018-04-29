---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Geek, Linux-dev]
comments: []
date: 2018-02-21 18:40:55 -0600
date_gmt: 2018-02-21 18:40:55 -0600
layout: post
published: true
status: publish
tags: []
title: Running Multiple Firefox Profiles on Linux
wordpress_id: 1712
wordpress_url: http://tartley.com/?p=1712
---
I recently switched from Chrome to Firefox. It's so *fast*, and easier
to trust that Mozilla has my privacy and interests at heart than Google
does.

I want to run a second profile at work, to keep a distinct set of open
tabs, bookmarks, and the like.

Close all Firefox windows. Run the Profile Manager with `firefox -p`.
Create a second profile.

Open Firefox and find the directories your profiles live by browsing to
`about:profiles`.

Substitute those directories into this firefox.desktop file, where I've
marked 'XXX':

```
# Gnome3 .desktop file for Firefox with multiple profiles
[Desktop Entry]
Version=1.0
Name=Firefox
Comment=Browse the web
GenericName=Web Browser
Keywords=Internet;WWW;Browser;Web;Explorer
Type=Application
Exec=firefox --no-remote %u
Terminal=false
X-MultipleArgs=false
Icon=firefox
Categories=GNOME;GTK;Network;WebBrowser;
Actions=home;work
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true

[Desktop Action home]
Name=Firefox (home)
Exec=firefox --profile .mozilla/firefox/XXX --no-remote %u

[Desktop Action work]
Name=Firefox (work)
Exec=firefox --profile .mozilla/firefox/XXX --no-remote %u
```

Save the above as firefox.desktop and install using:

``` shell_session
$ desktop-file-validate firefox.desktop
$ desktop-file-install --dir=.local/share/applications firefox.desktop
```

This results in a Firefox icon in your applications menu that defaults
to whichever profile you mark as default in the ProfileManager, but
right clicking lets you select the home or work profile explicitly. Open
each, and change the theme in one of them so the windows are visually
distinct.

Tested on RHEL 7.3, probably works on all Gnome3 desktops.
