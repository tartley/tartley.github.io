---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Books]
comments:
- {author: 'Review: Expert Python Programming by Packt (2008) | Entrepreneurial Geekiness',
  author_email: '', author_url: 'http://ianozsvald.com/2009/02/08/review-expert-python-programming-by-packt-2008/',
  content: '[...] a free chapter and a set of other reviews.  Ian is a professional
    screencaster (ProCasts), Python programmer, Artificial Intelligence [...]', date: '2009-02-08
    16:55:11 -0600', date_gmt: '2009-02-08 16:55:11 -0600', id: 19495}
date: 2009-01-11 22:58:26 -0600
date_gmt: 2009-01-11 22:58:26 -0600
layout: post
published: true
status: publish
tags: []
title: Expert Python Programming
wordpress_id: 609
wordpress_url: http://tartley.com/?p=609
...
---

**[![expert-python-programming](http://tartley.com/wp-content/uploads/2009/01/expert-python-programming.jpg "expert-python-programming"){.alignleft
.size-full .wp-image-612 width="194"
height="240"}](http://www.packtpub.com/expert-python-programming/book)by
Tarek ZiadÃ©** ([about the book on Pack's
website](http://www.packtpub.com/expert-python-programming/book))

*Publisher [Packt](http://www.packtpub.com/) were nice enough to send me
a copy of this, so I'm completely biased. Fortunately for everyone, I
really liked it. But I have to say that. But I really did!\
*

I've been using [Python](http://python.org/) for a couple of years now,
but only on a [single project](http://resolversystems.com/), so while
there are parts of it that I know very well, there is doubtlessly a lack
of cross-fertilisation in the things I am exposed to. So I was looking
forward to this book.

Surprisingly, for such a straightforward-sounding title, it is not at
all what I expected.

What I expected was analyses and illustrations of using Python's more
powerful features: [dynamic
designs](http://en.wikipedia.org/wiki/Dynamic_programming_language);
[creating classes on the
fly](http://jjinux.blogspot.com/2005/03/python-create-new-class-on-fly.html);
[functional
programming](http://en.wikipedia.org/wiki/Functional_programming)
styles;
[closures](http://en.wikipedia.org/wiki/Closure_(computer_science)) and
[metaclasses](http://en.wikipedia.org/wiki/Metaclasses).

Sure enough, there is an early couple of chapters devoted to advanced
language features. First up,
[iterators](http://docs.python.org/library/stdtypes.html#iterator-types),
and [generator
expressions](http://docs.python.org/tutorial/classes.html#generator-expressions),
and then the [`.send`, `.throw` and `.close`
methods](http://www.python.org/doc/2.6/reference/expressions.html#yield-expressions)
on a
[generator](http://docs.python.org/tutorial/classes.html#generators),
which induce the [`yield`
statement](http://docs.python.org/reference/simple_stmts.html#the-yield-statement)
to return values or raise exceptions. This is then used to handily
illustrate [coroutines](http://en.wikipedia.org/wiki/Coroutine) as a
method of [co-operative
multi-tasking](http://en.wikipedia.org/wiki/Co-operative_multitasking#Cooperative_multitasking.2Ftime-sharing)
without the calamity involved with getting all
[multi-threaded](http://en.wikipedia.org/wiki/Thread_(computer_science)).
It's exactly the sort of feature I'd pondered writing for myself for a
[personal project](http://code.google.com/p/sole-scion/), oblivious that
the language provides it out of the box.

Other low-level topics covered include the indispensable
[`itertools`](http://docs.python.org/library/itertools.html) module,
interesting uses of [function
decorators](http://www.python.org/dev/peps/pep-0318/), best practices
for subclassing built-in types, sensible use of [descriptors and
properties](http://users.rcn.com/python/download/Descriptor.htm),
understanding [method resolution
order](http://www.python.org/download/releases/2.3/mro/) and using
[`super`](http://docs.python.org/library/functions.html#super), the
often-overlooked
[`slots`](http://docs.python.org/reference/datamodel.html#id3), and
finally [meta-programming](http://en.wikipedia.org/wiki/Metaprogramming)
and
[metaclasses](http://www.voidspace.org.uk/python/articles/metaclasses.shtml).

Interestingly, this list has only one item of overlap with my
expectations. Tarek has done a good job of choosing important but
sometimes overlooked topics, and while, inevitably, I was very familiar
with some of the things he talked about, other sections were complete
revelations for me.

However, this is only chapters 2 and 3! The rest of the book expands in
scope beyond Python the language, to look at the environments and tools
that make up the Python ecosystem. In a way, this sounded less
intriguing to me than the computer-science oriented exploration of
language features that I had expected. But having finished the book, I
now realise that it was exactly what I needed.

The opening chapter goes through installing Python - a topic which I
didn't think needed discussion. But Tarek goes on to cover using [MinGW
and MSYS](http://www.mingw.org/) to set up a credible command-line
environment under Windows. I've always used
[Cygwin](http://www.cygwin.com/) for this in the past, and trying out
MSYS (coupled with the project
[Console](http://sourceforge.net/projects/console/)) is a breath of
fresh air.

This cross-platform development environment is then rounded out a little
by installing and using things like
[setuptools](http://peak.telecommunity.com/DevCenter/setuptools), and
some thoughtful notes on integrating Python development into editors
like [Vim](http://www.vim.org/) and
[Emacs](http://www.gnu.org/software/emacs/), or an IDE like
[Eclipse](http://www.eclipse.org/).

The rest of the book covers some of the major tools in the Python world.

I've never previously been forced to get to grips with
[Distutils](http://docs.python.org/library/distutils.html). Applying
lessons from the book to a personal project got me completely up to
speed with using Distutils to create packages, making source and binary
distributions, using
[eggs](http://peak.telecommunity.com/DevCenter/PythonEggs), and
distributing dependant packages that together make up an application.
The only thing really missing from this is maybe generating stand-alone
executables using [py2exe](http://www.py2exe.org/) (for Windows) or
[py2app](http://undefined.org/python/py2app.html) (for Macs), although
this idea is mentioned in passing.

The following chapters give competent overviews of a wide variety of
topics:

8\. [Version control
systems](http://en.wikipedia.org/wiki/Revision_control): centralised,
illustrated by [Subversion](http://subversion.tigris.org/), or
distributed like
[Mercurial](http://www.selenic.com/mercurial/wiki/index.cgi/Mercurial).
Continuous integration using [Buildbot](http://buildbot.net/trac).
Presumably you will either already know these inside-out or else will
lap them up hungrily.

9\. [Waterfall](http://en.wikipedia.org/wiki/Waterfall_model),
[spiral](http://en.wikipedia.org/wiki/Spiral_model) and
[iterative](http://en.wikipedia.org/wiki/Iterative_development) project
life cycles. I'm not sure that *waterfall* is really used by anyone
except in case studies of 'what not to do', and I'm also not sure how
you could be a developer without being aware of this, but maybe that's
precisely the point: You can't be a developer if you don't do this. This
chapter then covers setting up an instance of
[Trac](http://trac.edgewall.org/) and using it to manage a project's
deliverables, defects, and milestones.

10\. Documenting a project using
[ReStructuredText](http://docutils.sourceforge.net/rst.html) and
[Sphinx](http://sphinx.pocoo.org/), and including hints on good
technical writing. This caused me to completely revamp the content of my
small personal project's documentation, and as a result it is both much
improved, and shorter to boot. Wins all round.

11\. [Test-Driven
Development](http://en.wikipedia.org/wiki/Test_driven_development). This
chapter would be a superb overview of the topic for someone who didn't
know about TDD. Although I use TDD extensively at work, I've never used
[nose](http://somethingaboutorange.com/mrl/projects/nose/), fearing that
getting to grips with it might be too intrusive or disruptive. In fact,
it is seamless to begin using it in a small way and slowly extend into
its more advanced features as and when you need them.

12\. Optimisation : General principles (ie. don't) and profiling
techniques. I had never used the
[cProfile](http://docs.python.org/library/profile.html) module described
here, having just whipped up homespun profilers on-the-spot whenever I
needed them, and it's a valuable addition to my arsenal.

13\. Optimisation : Solutions. [Big O
notation](http://en.wikipedia.org/wiki/Big_O_notation). Correct use of
different collection types.
[Multi-threading](http://docs.python.org/library/threading.html),
[multi-processing](http://docs.python.org/library/multiprocessing.html#module-multiprocessing),
caching. Not much that is tremendously new to me here, but it is
obviously a huge topic to cover in a a single chapter, and it covers the
bases competently.

14\. [Design Patterns](http://en.wikipedia.org/wiki/Design_patterns), and
how they apply (or don't) to Python. It has been said that design
patterns, as fundamental and necessary as they are to a software
engineer's mindset, are a symptom a language's lack of
[expressivity]{#query .query}. You shouldn't have to write [huge gobs of
code](http://www.dofactory.com/Patterns/PatternVisitor.aspx#csharp-scroll)
to express simple conceptual relationships. Although Tarek never
explicitly says this, to some extent it is born out by this chapter.
Trivial (and
[much-maligned](http://misko.hevery.com/2008/08/17/singletons-are-pathological-liars/))
ideas like the
[*Singleton*](http://en.wikipedia.org/wiki/Singleton_pattern), after a
page or two of alternate implementations, boil down to simply 'use a
module', i.e. zero lines of code. Slightly more complex patterns such as
[*Visitor*](http://en.wikipedia.org/wiki/Visitor_pattern), are only a
few lines. It is still useful to discuss and name patterns, but on the
whole reference implementations are so trivial as to be unnecessary,
except perhaps as the most concise and precise method of illustration.

The book overall, then, is a grab-bag of different topics. Each chapter
could clearly be expanded into one or more whole books. As a result, no
part can be covered in very great depth, but Tarek does an admirable job
of getting the reader up to speed enough in each area that they can be
self-sufficient and direct their own learning from that point.

As as result of the broad scope of the book it serves as a brilliant
annotated laundry list of 'things the Python developer ought to know'.
While there will doubtlessly be some sections that you are already
deeply familiar with, if you have any interest in discovering your own
deficiencies as a Python programmer, I can highly recommend it.

Rating: 7.5/10 - Made concrete improvements to the way I work every day.
