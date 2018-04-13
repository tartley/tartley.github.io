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
...
---

Stick something like this in your .bashrc file:

``` {lang="bash"}
# set PS1, last exit code if != 0, and PWD, with colors
PRE='\[
```

33\[' POST='m\\\]' COL\_LASTEXIT="\${PRE}01;41;37\${POST}" \# last
command exit value COL\_PWD="\${PRE}00;01;36\${POST}" \# current
directory COL\_DEFAULT="\${PRE}00\${POST}" \# back to default colors
export PS1="\$COL\_LASTEXIT\\\${?\#0}\$COL\_PWD
\\w\$COL\_DEFAULT\\n\\\\\$ "

Command exit values other than zero are displayed in the subsequent
prompt:

\[caption id="attachment\_658" align="alignnone" width="442"
caption="Check out the little red '1'"\]![Check out the little red
'1'](http://tartley.com/wp-content/uploads/2009/02/last-exit-value.png "last-exit-value"){.size-full
.wp-image-658 width="442" height="229"}\[/caption\]

It's the

    ${?#0}

bit which includes the last command exit value in the prompt, unless the
value is zero, in which case nothing is displayed.
