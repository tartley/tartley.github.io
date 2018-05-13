---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [IMHO, Software]
comments:
- {author: Bazza, author_email: barrett_hogue@hotmail.com, author_url: 'http://',
  content: "While it doesn't necessarily counter any of his/your arguments, it is\
    \ worth noting that generics in C# are <a href=\"http://en.wikipedia.org/wiki/Comparison_of_C_Sharp_and_Java#Generics\"\
    \ rel=\"nofollow\">implemented differently</a> than in Java and C++.  Whereas\
    \ in Java (and I believe C++) the compiler expands the generic at compile time\
    \ into wrapping methods (and loses track of the underlying type the generic is\
    \ for), the .NET Framework actually produces a unique type for each generic. \
    \ Additionally, C# supports generics with value types, which Java doesn't support.\r\
    \n\r\nFrom my own limited experience, while they can certainly add to complexity,\
    \ if used sparingly (ie mainly for collections), they seem to be an excellent\
    \ tool.  At least, it feels much more natural and efficient to me to declare an\
    \ object of type List<string, Customer> than taking the time to create my own\
    \ collection or some other way of solving the problem. I certainly agree that\
    \ they can create large amounts of complexity if used in abundance, but I feel\
    \ like there are plenty of other languages features that have the same effect.",
  date: '2007-06-30 22:00:27 -0500', date_gmt: '2007-06-30 22:00:27 -0500', id: 3191}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Fair enough Barrett. You're definitely right about a few things: My experience\
    \ with generics in C++ does use type erasure like Java, which lacks several groovy\
    \ features of the .NET implementation you describe (good link - that taught me\
    \ lots I didn't know.)\r\n\r\nI agree with you that, used sparingly, they can\
    \ be handy, and they do certainly have a great intuitive appeal, especially for\
    \ static-typed languages. I have a vague worry though, that the intuitive appeal\
    \ might just be a psychologically indulgent promise of control, which sober analysis\
    \ reveals doesn't actually help very much.\r\n\r\nI fear that 'sparing use' might\
    \ be tricky sometimes to keep on top of. It got to the stage in the C++ world\
    \ where in many circles it felt like you weren't really writing good code unless\
    \ you'd templated the hell out of everything. They creep insidiously, always with\
    \ best intentions, but sooner or later you look around to find yourself knee-deep\
    \ in syntactic soup, templates of templates everywhere. I guess, like you point\
    \ out, like a lot of over-used language features, this is down to discipline:\
    \ personal, organisational and community-wide.", date: '2007-07-03 08:41:37 -0500',
  date_gmt: '2007-07-03 08:41:37 -0500', id: 3193}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: Or you could just a dynamic language with no need for generics whatsoever...,
  date: '2007-07-06 16:49:08 -0500', date_gmt: '2007-07-06 16:49:08 -0500', id: 3195}
- {author: Tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Whoa? What wasn''t me. Who''s kidnapping my work desktop again? Fuzzyman?
    Bad developer!', date: '2007-07-09 09:36:13 -0500', date_gmt: '2007-07-09 09:36:13
    -0500', id: 3196}
- {author: fuzzyman, author_email: fuzzyman@voidspace.org.uk, author_url: 'http://www.voidspace.org.uk/index2.shtml',
  content: "Yeah, it was me. Sorry :-(\r\n\r\nThe alternative was to log you out on\
    \ your own machine of course...", date: '2007-07-15 17:23:04 -0500', date_gmt: '2007-07-15
    17:23:04 -0500', id: 3197}
- {author: fuzzyman, author_email: fuzzyman@voidspace.org.uk, author_url: 'http://www.voidspace.org.uk/index2.shtml',
  content: 'It was a good comment though, right?', date: '2007-07-15 17:23:35 -0500',
  date_gmt: '2007-07-15 17:23:35 -0500', id: 3198}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: Right., date: '2009-08-29 13:16:45 -0500', date_gmt: '2009-08-29 13:16:45
    -0500', id: 22963}
date: 2007-06-30 15:03:34 -0500
date_gmt: 2007-06-30 15:03:34 -0500
layout: post
published: true
status: publish
tags: []
title: Generics Considered Harmful
wordpress_id: 154
wordpress_url: http://tartley.com/?p=154
---

Ken Arnold posted about the [problems with
generics](http://weblogs.java.net/blog/arnold/archive/2005/06/generics_consid_1.html),
namely that they substantially increase code complexity without
providing commensurate benefits.

He's spot on - generics are the programming language feature that never
should have happened, and I speak as someone who, when I was a heavy
user of C++, *loved* generics. Even now I yearn for the elegant
consistency of the Standard Template Library. But the points Ken makes
from a Java perspective apply equally well to C++, and C\# as well. That
generics increase both the semantic and syntactic complexity of code is
undeniable. Their benefit as a runtime type-checking mechanism *does*
prevent - or at least help diagnose - certain classes of bug. But these
bugs are not generally especially common, nor difficult to diagnose or
fix in the first place. This can be seen quite clearly when considering
that dynamic languages, which enforce no type checking at all, do not
suffer in development effort nor code maintainability as a result - if
anything, they demonstrate the converse.

One benefit that Ken doesn't mention is the use of generics to signal a
programmer's intent - to make a collection homogeneous is, to a limited
extent, to make it self-documenting. Again though, this benefit is small
compared to the complexity costs.

When I started typing I thought I had more of a point. Ho hum.