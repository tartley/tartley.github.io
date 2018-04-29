---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Software, MSWin-dev, Git]
comments:
- {author: Russel Winder, author_email: russel@russel.org.uk, author_url: 'http://www.russel.org.uk',
  content: 'Why not just run "gitk --all"?  Or bettter still "gitg --all" since the
    GTK version looks so much nicer than the tk version.', date: '2010-12-31 19:17:34
    -0600', date_gmt: '2010-12-31 19:17:34 -0600', id: 36895}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: Hooray! Thank-you Russel! The answer is simply that I didn't know '--all'
    existed. You have saved me from myself., date: '2011-01-04 12:07:13 -0600', date_gmt: '2011-01-04
    12:07:13 -0600', id: 37074}
- {author: Hossain Cyrus, author_email: hmcyrus@yahoo.com, author_url: '', content: "it's\
    \ \"gitk --all\" not \"gitk &ndash;all\" \r\ni became mad trying \"gitk &ndash;all\"\
    \ 5 minutes :|", date: '2013-06-27 06:28:44 -0500', date_gmt: '2013-06-27 05:28:44
    -0500', id: 84408}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Hey Hossain. As you have possibly by now realised, WP ''helpfully'' converts
    all instances of double-minus in a post or comment into em-dashes. I think I''ll
    try to prevent it from doing so by replacing hyphens with "&amp;#45;", which yields
    "&#45;".', date: '2013-07-25 13:24:47 -0500', date_gmt: '2013-07-25 12:24:47 -0500',
  id: 107928}
date: 2010-12-31 12:25:31 -0600
date_gmt: 2010-12-31 12:25:31 -0600
layout: post
published: true
status: publish
tags: []
title: Launch Gitk displaying all branches
wordpress_id: 1290
wordpress_url: http://tartley.com/?p=1290
---

**Update:** All of the below is made totally redundant by simply using
`gitk --all`. Thanks Russel!

When I launch Gitk, it just displays the current branch. To display
other branches, you must name them on the command line. To display all
existing branches, you need to find out all the branch names:

``` shell_session
$ git branch
  create-sql-dev
  formula-rewrite
* master
```

Then laboriously type them in to the gitk command line:

``` shell_session
$ gitk create-sql-dev formula-rewrite master
```

Alternatively, save this Bash snippet in a script on your PATH. I call
mine gitka, for 'all branches':

``` bash
#!/usr/bin/bash
# run gitk, displaying all existing branches
for b in "`git branch`"; do echo "$b"; done | tr -d "*" | xargs gitk
```

![Gitk displaying all branches, not just the current ('master' in bold)](/assets/2010/12/gitk-all-branches.png "gitk-all-branches")

This works on Windows too, if you save it as 'gitka.sh', and have Cygwin
installed and associate the .sh filename extension with the Cygwin Bash
executable. You can then run it as 'gitka' from a Windows command prompt
thingy. If you then use 'ln -s gitka.sh gitka', then you can also run it
as just 'gitka' from a Cygwin bash prompt too - without this you would
have had to type out the full 'gitka.sh'.
