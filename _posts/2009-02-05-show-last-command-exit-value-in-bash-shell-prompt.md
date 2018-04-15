---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Geek]
comments:
- {author: Kamil, author_email: kaml@dworakowski.name, author_url: 'http://blog.kamil.dworakowski.name',
  content: I like that color scheme., date: '2009-02-05 13:21:59 -0600', date_gmt: '2009-02-05
    13:21:59 -0600', id: 19439}
- {author: Kamil, author_email: kamil@dworakowski.name, author_url: 'http://kamil.dworakowski.name',
  content: "Below follows a minimal change to the bash prompt. Just add the conditional\
    \ red result at the front.\r\n\r\nPRE='\\[33['\r\nPOST='m\\]'\r\nCOL_LASTEXIT=\"\
    ${PRE}01;41;37${POST}\" # last command exit value\r\nCOL_DEFAULT=\"${PRE}00${POST}\"\
    \ # back to default colors\r\nexport PS1=\"$COL_LASTEXIT\\${?#0}$COL_DEFAULT\\\
    [33[01;32m\\]\\u@\\h\\[33[01;34m\\] \\w \\$\\[33[00m\\] \"", date: '2009-08-28
    21:49:29 -0500', date_gmt: '2009-08-28 21:49:29 -0500', id: 22959}
date: 2009-02-05 12:11:57 -0600
date_gmt: 2009-02-05 12:11:57 -0600
layout: post
published: true
status: publish
tags: []
title: Show last command exit value in Bash shell prompt
wordpress_id: 657
wordpress_url: http://tartley.com/?p=657
---

Stick something like this in your .bashrc file:

``` bash
# display red exit value if it isn't zero
PROMPT_COMMAND='EXITVAL=$?; '$PROMPT_COMMAND
GET_EXITVAL='$(if [[ $EXITVAL != 0 ]]; then echo -n "\[\e[37;41;01m\] $EXITVAL \[\e[0m\] "; fi)'
export PS1="$GET_EXITVAL$PS1"
```

Command exit values other than zero are displayed in the subsequent
prompt:

![Check out the little red '1'](/assets/2009/02/last-exit-value.png)

(see the little red '1').

It's the

    ${?#0}

bit which includes the last command exit value in the prompt, unless the
value is zero, in which case nothing is displayed.
