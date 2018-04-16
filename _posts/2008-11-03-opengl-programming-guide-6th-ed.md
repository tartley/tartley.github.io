---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Books, Software, Graphics]
comments:
- {author: Jonathan Hartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Commenting on my own posts. Gah.\r\n\r\nJust saw a couple of talks at\
    \ PyCon by Mike C. Fletcher, creator of PyOpenGL, and in chatting to him afterwards\
    \ he confirmed that using the traditional parts of the OpenGL API in traditional\
    \ ways (which this book is all about) is a \"complete anti-pattern\". These parts\
    \ of the API are implemented on modern graphics cards by simulating the traditional\
    \ OpenGL hardware using shaders. Such shaders have to be very general-purpose,\
    \ to account for all of OpenGL's many features. So they are very slow.\r\n\r\n\
    In contrast, writing your own shader to perform just the parts of the pipeline\
    \ that you need (eg. just modelview transformation and vertex color interpolation,\
    \ no lighting nor textures, etc, etc) can be much faster.\r\n\r\nCombine this\
    \ with the fact that working in this way lets you dump the entire geometry of\
    \ many meshes into a single vertex buffer, then apply the appropriate modelview\
    \ transform to each mesh in a single pass - this alleviates the overhead of multiple\
    \ calls to glDrawArrays combined with the ctypes conversions that make Python\
    \ opengl stuff go dog slow.\r\n\r\nI am becoming enlightened. Time to press on\
    \ with that Shader book.", date: '2009-04-08 18:56:36 -0500', date_gmt: '2009-04-08
    18:56:36 -0500', id: 20521}
- {author: tartley.com &raquo; Blog Archive &raquo; Opengl Shading Language, author_email: '',
  author_url: 'http://www.tartley.com/?p=761', content: '[...] whined about the Red
    Book, but this "Orange" OpenGL Shading Language book is brill - just what I needed.
    Incisive without [...]', date: '2009-05-11 22:19:32 -0500', date_gmt: '2009-05-11
    22:19:32 -0500', id: 21010}
date: 2008-11-03 18:48:55 -0600
date_gmt: 2008-11-03 18:48:55 -0600
layout: post
published: true
status: publish
tags: []
title: OpenGL Programming Guide, 6th ed.
wordpress_id: 423
wordpress_url: http://www.tartley.com/?p=423
---

![](/assets/2008/10/opengl-programming-guide.jpg "opengl-programming-guide"){.alignleft
.size-full .wp-image-424 width="185" height="240"}Written by none other
than the OpenGL architecture review board themselves, this is the de
facto starting point for anyone learning how to write programs to draw
computer graphics using the OpenGL graphics API. As such, the entire
breadth of OpenGL is described in these 800 weighty pages.

This comes with one or two questionable implications. Firstly, the
authors, being the authoritative source, are obliged to cover the
entirety of the OpenGL interface, even though portions of it are now
obsolete, having been supplanted in practice by newer techniques. The
older methods are still present, and are described here on an equal
footing with the later additions.

Similarly, to avoid getting embroiled in the idiosyncrasies of any
particular vendor's implementation of OpenGL, there is never more than
an occasional vague allusion to the potential performance implications
of using one approach over another. The concept of using vertex arrays
is covered in a general-principles sort of way, as are vertex buffer
objects, with the admonition to "prefer them over explicit calls to
glVertex() for performance" buried in an appendix-like chapter near the
end. The idea that rendering primitives of GL\_TRIANGLES is heavily
optimised on modern graphics cards receives no mention, from which I
mistakenly inferred that other primitive types such as
GL\_TRIANGLE\_STRIPs, with their lower apparent vertex counts, are a
preferable alternative.

This egalitarian presentation means that the book can rightly claim to
be an unbiased description of OpenGL the interface, and is lent a
long-term relevance by giving no bias towards any particular vendor, nor
being subject to the fashions of rendering techniques that sweep through
the industry every few years. On the other hand, it also means that the
book is considerably larger than most people learning OpenGL will need,
and fails to cover many of the vastly performance-enhancing techniques
that have become standard throughout the industry.

Rating: 6/10.

I bought the 'Orange' Shader Language book next. Can anyone recommend
one of the other OpenGL books that are out there? Since they are all 800
pages I'd rather not wade through them all to find the best one.
