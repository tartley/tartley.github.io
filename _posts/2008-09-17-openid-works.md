---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Geek, Journal]
comments:
- {author: Michael Foord, author_email: michael@voidspace.org.uk, author_url: 'http://www.ironpythoninaction.com',
  content: "Shame there's only about three places you can use it...\r\n\r\nI've had\
    \ one for ages (you're late to the party) - but I still end up using it less than\
    \ once a week...\r\n\r\nIt works with stackoverflow.com though (and also sourceforge).\
    \ :-)", date: '2008-09-17 19:38:34 -0500', date_gmt: '2008-09-17 19:38:34 -0500',
  id: 17696}
- {author: Nixta, author_email: nfurness@nixta.com, author_url: 'http://nixtarolls.nixta.com',
  content: "Don't the comments in the article you link to (Ned Batchelder's rant)\
    \ seem to indicate that this is both insecure and inconvenient?\r\n\r\nI don't\
    \ know exactly how it works (it bemused me when I once tried, for the same reasons\
    \ it bemused Ned, although he persisted once I'd already given up) but one thing\
    \ that jumps out is that it relies on DNS which isn't exactly the most secure\
    \ or unspoofable thing around.\r\n\r\nMe so unconwinced!", date: '2008-09-17 21:04:12
    -0500', date_gmt: '2008-09-17 21:04:12 -0500', id: 17698}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey Nick,\r\n\r\nAll you say has elements of truth in it. OpenID is certainly\
    \ a pain to set up initially, as both Ned, yourself and I found.\r\n\r\nHowever,\
    \ once in place I've found it convenient to use, no less so than signing up for\
    \ new accounts at websites anyhow, especially if they ask for more info than just\
    \ 'username/desiredpassword/confirmpassword'\r\n\r\nRegarding the security, it's\
    \ certainly possible to use it in an insecure manner. This is generally the case\
    \ with many aspects of security, not just OpenID-related stuff. It is possible\
    \ to guard against the sort of problems you mention using a handful of mechanisms:\r\
    \n\r\n1) make sure you choose an openID provider who offers browser side SSL certificates\
    \ instead of just username/password logons.\r\n2) make sure you choose an openID\
    \ provider who publishes a security certificate revocation list, and enable the\
    \ use of such lists on your brower\r\n3) use the methods your openID provider\
    \ gives to let you verify that they are really them, not a phishing attack instigated\
    \ by polluted DNS, eg. mine displays an image that I chose and saved in a cookie.\
    \ Nobody other sites have access to that cookie, so if I don't see the image,\
    \ then I know something's up. Obviously I have to set this cookie on every computer\
    \ I use.\r\n\r\nOne of the strengths of openID is that I don't have to choose\
    \ one central provider and cross my fingers that them implement all of the above\
    \ : there are many openID providers and one of the axes upon which they compete\
    \ is in the security features they offer. Eventually, once we've figured all this\
    \ out, presumably they will all provide things like this as standard, and will\
    \ gradually figure out a way to make the initial setup more convenient. This is\
    \ my hope, anyway. I don't see any more viable solutions to this problem, so I'm\
    \ happy to run with OpenID until anything better comes along.\r\n\r\nBut basically\
    \ I was afraid that if I signed up too late, then all the good usernames would\
    \ be gone.\r\n", date: '2008-09-18 10:23:35 -0500', date_gmt: '2008-09-18 10:23:35
    -0500', id: 17711}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: '@michael: That''s funny, I already use mine several times a day. I guess
    you aren''t browsing the same giraffe-neck fetish sites that I am.', date: '2008-09-20
    11:12:55 -0500', date_gmt: '2008-09-20 11:12:55 -0500', id: 17746}
date: 2008-09-17 19:06:48 -0500
date_gmt: 2008-09-17 19:06:48 -0500
layout: post
published: true
status: publish
tags: []
title: OpenID works!
wordpress_id: 386
wordpress_url: http://www.tartley.com/?p=386
---

![](/assets/2008/09/openid.jpeg "openid"){.alignleft
.size-full .wp-image-387 width="107" height="105"}I've always been
intrigued by [OpenID](http://openid.net), while simultaneously being
repulsed by the identifiers that I thought users were forced to adopt.
Seeing one too many strings like:

> https://me.yahoo.com/a/.DuSz\_IEq5Vw5NZLAHUFHWEKLSfQnRFuebro-

tossed around made me think I'd have to adopt a username like that,
which obviously is never going to wash, for aesthetic and typability
reasons alone.

Fortunately [Ned Batchelder's
rant](http://nedbatchelder.com/blog/200809/openid_is_too_hard.html),
leading me to [Simon 'Zeppelin' Willison's demystifying blog
post](http://simonwillison.net/2006/Dec/19/openid/), taught me all about
how to use your own URL as your OpenID equivalent of a username, by
inserting some HTML onto your web page. So now I've managed to jump
through the sign-up hoops required to get me one of those
globally-unique OpenID username identifiers for myself:

> tartley.com

There. That isn't too painful, is it? Since I got set up, it has proven
lovely to use. Get on board!
