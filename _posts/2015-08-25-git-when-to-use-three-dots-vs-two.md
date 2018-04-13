---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Geek, Version control, Git]
comments:
- {author: nixta, author_email: nfurness@nixta.com, author_url: 'http://nixtasinks.nixta.com',
  content: 'No, but there''s a word for "misremember" and it''s "forget" ', date: '2015-08-26
    13:42:52 -0500', date_gmt: '2015-08-26 12:42:52 -0500', id: 1060960}
- {author: nixta, author_email: nfurness@nixta.com, author_url: 'http://nixtasinks.nixta.com',
  content: Sad face. Your commenting system doesn't handle emoji., date: '2015-08-26
    13:43:27 -0500', date_gmt: '2015-08-26 12:43:27 -0500', id: 1060961}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'I think ''misremember'' has a useful meaning, distinct from ''forget''.
    Don''t you?', date: '2015-09-05 11:02:29 -0500', date_gmt: '2015-09-05 10:02:29
    -0500', id: 1061065}
date: 2015-08-25 11:51:30 -0500
date_gmt: 2015-08-25 10:51:30 -0500
layout: post
published: true
status: publish
tags: []
title: 'Git: When to use three dots vs two'
wordpress_id: 1638
wordpress_url: http://tartley.com/?p=1638
...
---

I endlessly misremember when to use '...' in git versus '..'. That ends
today:

To see the commits or diffs introduced by a branch:

         f
        +●  m           git log m..f
         |  ○
        +●  |           git diff m...f
          \ ○
           \|
            ○

To see the commits or diffs between the tip of one branch and another:

         f              git log m...f
        +●  m           All commits look the same,
         |  ●-          unless you use --left-right, which
        +●  |           shows where each commit comes from.
          \ ●-
           \|           git diff m..f
            ○           '-' commits are shown inverted,
                         i.e. additions as deletions.

To see the commits from 'f' back to the beginning of time:

         f
        +●  m           git log f
         |  ○
        +●  |           (diffs back to start of time are just
          \ ○            the contents of the working tree)
           \|
           +●
            |
           +●

Throughout, omitted branchname defaults to current HEAD, i.e:

        git diff m..f

is the same as

        git checkout m
        git diff ..f

or

        git checkout f
        git diff m..

Is there a word for unicode ascii art?
