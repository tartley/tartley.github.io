---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Geek, Journal]
comments: []
date: 2008-04-23 06:50:01 -0500
date_gmt: 2008-04-23 06:50:01 -0500
layout: post
published: true
status: publish
tags: []
title: History meme
wordpress_id: 323
wordpress_url: http://tartley.com/?p=323
---

    $ history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head
    107 ll # an alias for ls -l
    92 cd
    50 ./next.sh # a script I use during a presentation I've given a lot recently
    35 vi
    19 imageresize # a script I wrote to shrink photos before uploading them
    17 sudo
    17 rm
    17 gvim
    17 ctags # Does 'history' include shell commands executed by mappings within vi?
    13 ls
