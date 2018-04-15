---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Graphics]
comments:
- {author: fuzzyman, author_email: fuzzyman@voidspace.org.uk, author_url: 'http://www.voidspace.org.uk/index2.shtml',
  content: "Come on then - show us the code... :-)\r\n\r\nNice set of recentries by\
    \ the way...", date: '2007-06-12 09:54:11 -0500', date_gmt: '2007-06-12 09:54:11
    -0500', id: 2946}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'I just worked through the IronPython DirectX 9 tutorial, listed halfway
    down the <a href="http://www.codeplex.com/IronPython/Wiki/View.aspx?title=Samples"
    rel="nofollow">Codeplex IronPython samples</a> page, with scarcely half a dozen
    lines of my own tweaks introduced for curiosity and experimentation. I''ll post
    code once I write any of my own. :-)', date: '2007-06-12 12:25:19 -0500', date_gmt: '2007-06-12
    12:25:19 -0500', id: 2953}
date: 2007-06-12 08:40:52 -0500
date_gmt: 2007-06-12 08:40:52 -0500
layout: post
published: true
status: publish
tags: []
title: DirectX in IronPython
wordpress_id: 141
wordpress_url: http://tartley.com/?p=141
---

![pyopengl-screen01.jpg](http://tartley.com/wp-content/uploads/2007/06/pyopengl-screen01.jpg){.floatleft}

I've always preferred the open standards and cross-platform philosophy
of OpenGL over DirectX. In recent years though, development of OpenGL
has seemed to stall somewhat, while DirectX has continually put out new
iterations that seem to significantly enhance functionality while
improving useability. We use a lot of IronPython at
[Resolver](http://resolversystems.com/), the dotNET dialect of Python,
so the last couple of nights I thought I'd throw my principles and good
taste to the wind, and work through the IronPython samples to see how
well it works with the .Net interface of DirectX. The verdict: It works
just fine. Albeit with colossal dependancies, for something that simply
thows a dozen vertices around the screen. And only on one operating
system. Gah.
