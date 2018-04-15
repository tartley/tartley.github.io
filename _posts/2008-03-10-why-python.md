---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python]
comments: []
date: 2008-03-10 01:22:46 -0500
date_gmt: 2008-03-10 01:22:46 -0500
layout: post
published: true
status: publish
tags: []
title: Why Python?
wordpress_id: 302
wordpress_url: http://tartley.com/?p=302
---

![Python](http://tartley.com/wp-content/uploads/2008/03/python.png){.alignleft
.floatleft}A friend who is a doctor is considering learning Python as
his first programming language, to do some processing on some research
data. He asked me to give him the 30 second elevator pitch for Python,
to evaluate whether it's a wise choice. I enjoyed constructing the reply
so much that I decided to post it here, just in case it helps anyone
else in a similar situation.

Why Python?
-----------

Python is very accessible and intuitive. You should be able to produce
simple, useful programs in your first day of experimentation. The syntax
is clean and concise, without too much cryptic punctuation
([Perl](http://tartley.com/?p=197), I'm looking at you), redundancy or
unnecessary verbosity.

This accessibility isn't just a superficial convenience. Because of it,
writing a program in Python will take noticeably less time than many
other programming languages. The resulting program will be shorter and
more comprehensible, and will be easy to modify or extend in the future.

The simplicity of Python is not because it is in any way cut-down or
incapable. In fact, it is one of the most limber languages available,
including a carefully chosen cross-section of advanced language design
features, which enable it to adapt gracefully to many different
situations and programming styles. Its beauty lies in its ability to
provide the aforementioned simplicity regardless of the complexity of
the task to which you choose to put it.

Of those language design features, a couple are worthy of special
mention.

Python is one of a number of *dynamic languages*, which are in vogue at
the moment. Proponents would say that the entire history of programming
has been a gradual migration towards progressively more dynamic
languages. Dynamic languages, amongst other things, allow you to write
programs that modify themselves when they run. Instead of simply writing
a function yourself, you can instead write a function which **\*creates
a second function\***, and then call this second function, which will do
the thing you want done. This, and other sorts of brain-bending
meta-programming, seem a little abstract at first, but sometimes allow
some tremendous conceptual ju-jitsu, allowing very small amounts of code
to achieve enormous things.

Secondly, Python's dynamism facilitates a programming style known as
test driven development, of which I am big fan. The idea is that for
every bit of code you write, you **\*also\*** write a test, which
verifies that your code is doing the right thing. It isn't immediately
obvious that this is necessarily a very useful thing to do, but in
practice it reaps tremendous benefits. I evangelise about it often,
because I feel it is the single most important thing that most
programmers could do in order to be more productive and write better
code.

As well as the language itself, Python comes bundled with a
comprehensive set of pragmatic built-in standard libraries, which your
program can lean on to help you get things done with a minimum of
hassle. These libraries are augmented by a vibrant community of authors
producing third-party modules you can download and use as well.

As any good language should be, Python is cross-platform, so with a
minimum of tweaking, most Python programs should run on Windows or Macs
or Linux.

### Why not Python?

A notable alternative to Python is Ruby, which looks like a delightful
environment and community to be in. As a general-purpose tool, Ruby is
just as good as Python, and it excels in certain areas such as website
development. But Ruby is not compellingly better than Python. They are
more similar than they are different, and form healthy rivals.

There are other languages that are better than Python at particular
things, but none, in my opinion, are better than it for **\*most\***
things.

Something like C++ is better for sheer speed of program execution, or
for addressing the low-level bits and bytes that make up the electronics
of your computer. But it takes **\*years\*** to master C++. It's a
hard-core programmers language. I spent seven years living and breathing
it, and feel qualified to say that its practitioners can be slightly
masochistic about its inaccessible superiority. Even once mastered, it
is still a lot of work to write C++ programs.

Java and C\# are both very popular indeed - orders of magnitude more so
than Python, and are ubiquitous in conservative corporate enterprise
consulting shops. Both are slightly frowned-upon by computer science
academics (C\#, for example, for being ostensibly tied to Windows), but
nevertheless, these languages are not bad choices for many people.

Programs written in Python are usually slower than any other mainstream
programming language. This could be an issue if you intend to
intensively crunch large amounts of data in CPU intensive ways, for
example running a finite element analysis.

There are many Python libraries you can call which are, under the
covers, written in C. A prominent example is NumPy, for doing numerical
processing. Libraries like this might circumvent the performance issue
if one of them happens to handle your particular problem.

Even if there is no appropriate library available, slow performance
isn't as serious a drawback as it sounds. 99% of programs don't need to
do these sort of CPU intensive tasks, so Python's slowness makes no
discernible difference. Even in cases where performance is a factor,
Python makes it easy to modify and optimise your code to make it run
faster, which often alleviates the problem entirely.

Python uses indentation to define blocks of code instead of 'begin/end'
or '{}' delimiters like other languages. This caused no small amount of
controversy when it was introduced, with many veteran programmers
recoiling in horror, imagining nightmare scenarios in which simply
changing the whitespace in a program (eg adding more spaces or tab
characters) would unexpectedly change a program's behaviour. In
practice, however, this does not ever cause problems, and actually
eliminates an entire class of errors, wherein a programs appear to
behave strangely because the programmer has failed to keep the
indentation (which is useful to human readers of the code) in sync with
the delimiters (which are used by the computer.)

Multi-threading is an advanced technique in which a program casts off
new versions of itself, all running around simultaneously helping each
other out, sorcerers apprentice style. Python does not handle this well,
only utilising a single CPU on dual or quad core machines, and often
requiring careful crafting of finicky constructs to get it working
reliably. However, this is equally awkward in almost every other
language, and has had programmers tearing their hair out for decades, no
matter what language they use. There are exciting new approaches to this
in the language Erlang, but this is still too fringe to recommend as a
first language.

Python lacks some of the delightful academic brilliance of hardcore
functional languages such as Lisp and its derivatives, which are based
on the mathematics of the lambda calculus. In the right hands, these
tools can be devastatingly elegant and highly productive. However, many
of them lack a degree of day-to-day practicality in terms of available
libraries, and most people feel that they are initially unintuitive to
learn. Such languages will no doubt remain highly influential in
computer science circles, and are having something of a renaissance
these days, but they are sufficiently unorthodox for me not to recommend
as someone's first (and possibly only) programming language.
