---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Geek, Bash]
comments: []
date: 2015-03-15 10:50:09 -0500
date_gmt: 2015-03-15 10:50:09 -0500
layout: post
published: true
status: publish
tags: []
title: Listen to your phone through your PC speakers
wordpress_id: 1615
wordpress_url: http://tartley.com/?p=1615
---

Bash:

``` bash
#!/usr/bin/env bash

# Directs audio input (e.g. mic) to audio output (e.g. speakers),
# then sleeps forever. Stops audio redirection when it is killed.
# So, for example, plug your phone into the PC's mic, run 'listen',
# and listen to phone audio through your computer's speakers.
#
# Requires:
# sudo apt-get install pactl # Ubuntu

set -e

module=$(pactl load-module module-loopback)

function cleanup {
    pactl unload-module $module
}

trap cleanup EXIT

sleep infinity
```
