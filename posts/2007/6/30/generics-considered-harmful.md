<!--
.. title: Generics Considered Harmful
.. slug: generics-considered-harmful
.. date: 2007-06-30 15:03:34-05:00
.. tags: imho,software
.. link: 
.. description: 
.. type: text
-->


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