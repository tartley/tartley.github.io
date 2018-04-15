---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Software, Graphics]
comments:
- {author: Marius Gedminas, author_email: marius@gedmin.as, author_url: 'http://gedmin.as',
  content: "Nice diagram!\r\n\r\nI wonder how well SVG works after passing through\
    \ a couple of RSS aggregators (Planet Python, then Google Reader).  I wouldn't\
    \ be surprised to discover it doesn't survive their filtering, so thanks for the\
    \ png.", date: '2010-03-20 17:22:04 -0500', date_gmt: '2010-03-20 17:22:04 -0500',
  id: 26805}
- {author: pat, author_email: saluk64007@gmail.com, author_url: '', content: "Thank\
    \ you for this!\r\n\r\nIt looks really useful. It can be maddening to keep all\
    \ the different arrays in mind.", date: '2010-03-20 17:26:50 -0500', date_gmt: '2010-03-20
    17:26:50 -0500', id: 26806}
- {author: Donal Lafferty, author_email: dlafferty@gmail.com, author_url: '', content: 'A
    quick way to port this diagram for use with iPhone, i.e. generic vertex/fragment
    shaders, is to put attribute numbers for the v,c,n columns and rewrite the fixed
    pipeline functions in generic terms.  Could be a really cool active gif.', date: '2010-03-22
    09:14:38 -0500', date_gmt: '2010-03-22 09:14:38 -0500', id: 26868}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Thanks for the feedback, people.\r\n\r\nDonal: That sounds great, but\
    \ I don't think I'm currently up to the task. My lappy only supports a subset\
    \ of OpenGL 2.1, and I haven't really used buffers or shaders in anger.\r\n\r\n\
    However, I'd be delighted to try and figure it out and to actually draw the diagram\
    \ - especially if someone brainy such as yourself were to talk me through what\
    \ it should look like. :-)", date: '2010-03-22 12:07:45 -0500', date_gmt: '2010-03-22
    12:07:45 -0500', id: 26872}
- {author: Varrojo@Linux &raquo; Vistazo a la API de OpenGL para Dibujar, author_email: '',
  author_url: 'http://varrojo.algorithmia.net/2010/03/23/vistazo-a-la-api-de-opengl-para-dibujar/',
  content: '[...] en: http://tartley.com/?p=1045 Art&Atilde;&shy;culos Relacionados:Trabajando
    con PyOpenGL y VBOs (1.000)12 a&Atilde;&plusmn;os de portabilidad [...]', date: '2010-03-23
    20:26:17 -0500', date_gmt: '2010-03-23 20:26:17 -0500', id: 26915}
- {author: tito, author_email: tito@bankiz.org, author_url: 'http://txzone.net/',
  content: 'Thanks a lot for your scheme. But i was thinking that glVertexPoint &amp;
    cie are deprecated ?', date: '2010-05-04 14:29:48 -0500', date_gmt: '2010-05-04
    13:29:48 -0500', id: 27880}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey tito,\r\nYeah, you're absolutely right. I just felt compelled to include\
    \ them in the diagram out of some sort of 'neatness' fetish. I can't justify it.\
    \ I just liked showing they were the only API calls that connect directly to the\
    \ verts, colors, etc, which other API calls refer to indirectly through indices\
    \ or pointers. Foolish of me to label it 'opengl3.x' then. Good catch.", date: '2010-05-04
    14:58:53 -0500', date_gmt: '2010-05-04 13:58:53 -0500', id: 27883}
date: 2010-03-20 13:15:54 -0500
date_gmt: 2010-03-20 13:15:54 -0500
layout: post
published: true
status: publish
tags: []
title: OpenGL Draw API Visualised
wordpress_id: 1045
wordpress_url: http://tartley.com/?p=1045
---

To help me grok and remember the OpenGL 3.3 draw API, I drew them in a
diagram. I hope this will help me see at a glance what I can and can't
achieve with each function call.

![OpenGL array draw calls](/assets/2010/03/opengl-draw-calls.png)

I haven't annotated any of the parameter types. These days I tend to be
calling these functions from Python, so generally only care about the
values. Interestingly, the most recent additions to the API, such as
`glMultiDrawElements`, feature parameters such as
'`const void ** indices`'. Apparently the OpenGL Architecture Review
Board has also decided that they also no longer care about the types
either. Wise choice. :-)

**Updatate:** I wanted to publish this diagram as SVG, but apparently
these days that works in every browser except IE, surprise surprise.
