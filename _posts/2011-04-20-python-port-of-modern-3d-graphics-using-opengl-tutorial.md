---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Graphics]
comments:
- {author: vogre, author_email: vogre.z@gmail.com, author_url: '', content: "I recently\
    \ started porting the same one to Scala (at https://github.com/vogre/lwjgltut).\r\
    \n<>\r\n\r\nAnyway, it's a great tutorial, good luck with the port.", date: '2011-04-24
    16:20:39 -0500', date_gmt: '2011-04-24 15:20:39 -0500', id: 41742}
- {author: Jarav, author_email: krshnam@gmail.com, author_url: '', content: Looking
    forward to the port., date: '2011-04-26 12:32:49 -0500', date_gmt: '2011-04-26
    11:32:49 -0500', id: 41780}
- {author: Jarav, author_email: krshnam@gmail.com, author_url: '', content: "Just\
    \ tried running \"t01.hello-triangle\". Here is what I got:\r\n\r\nTraceback (most\
    \ recent call last):\r\n  File \"HelloTriangle.py\", line 129, in \r\n    main()\r\
    \n  File \"HelloTriangle.py\", line 123, in main\r\n    init()\r\n  File \"HelloTriangle.py\"\
    , line 89, in init\r\n    initialize_program()\r\n  File \"HelloTriangle.py\"\
    , line 69, in initialize_program\r\n    compileShader(strFragmentShader, GL.GL_FRAGMENT_SHADER)\r\
    \n  File \"/usr/lib/python2.7/site-packages/OpenGL/GL/shaders.py\", line 162,\
    \ in compileShader\r\n    shaderType,\r\nRuntimeError: (\"Shader compile failure\
    \ (0): 0(4) : error C5060: out can't be used with non-varying outputColor\\n\"\
    , ['\\n#version 120\\n\\nout vec4 outputColor;\\nvoid main()\\n{\\n   outputColor\
    \ = vec4(1.0f, 1.0f, 1.0f, 1.0f);\\n}\\n'], GL_FRAGMENT_SHADER)\r\n\r\nBlindly,\
    \ changed \"out vec4 outputColor;\" to \"varying out vec4 outputColor;\" and it\
    \ worked.", date: '2011-05-13 20:17:10 -0500', date_gmt: '2011-05-13 19:17:10
    -0500', id: 42291}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: '@jarav Thanks for the comment. No doubt I''m introducing errors in converting
    the original OpenGL 3 shaders into something my 2.1 drivers will accept.', date: '2011-05-15
    09:25:33 -0500', date_gmt: '2011-05-15 08:25:33 -0500', id: 42325}
- {author: Jarav, author_email: krshnam@gmail.com, author_url: '', content: I too
    have a rather old graphics card that supports only 2.1., date: '2011-05-15 10:15:13
    -0500', date_gmt: '2011-05-15 09:15:13 -0500', id: 42327}
date: 2011-04-20 14:23:54 -0500
date_gmt: 2011-04-20 13:23:54 -0500
layout: post
published: true
status: publish
tags: []
title: Python port of Modern 3D Graphics using OpenGL tutorial
wordpress_id: 1312
wordpress_url: http://tartley.com/?p=1312
...
---

To my knowledge, there are three online OpenGL tutorials which stand
head and shoulders above the rest:

-   [Learning Modern 3D Graphics Programming Through
    OpenGL](http://www.arcsynthesis.org/gltut/index.html) (C)
-   [An intro to modern
    OpenGL](http://duriansoftware.com/joe/An-intro-to-modern-OpenGL.-Table-of-Contents.html) (C)
-   [Learning
    WebGL](http://learningwebgl.com/blog/?category_name=lessons)
    (Javascript)

I recently started porting the first of these from C to Python.

<https://bitbucket.org/tartley/gltutpy>

This is primarily for my own benefit, and I've only done the first two
chapters thus far, but others may find some use in seeing the
translation. If anyone else is interested enough to want to contribute,
drop me a line and I'll happily grant commit rights.
