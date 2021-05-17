<!--
.. title: IronPython in Action
.. slug: ironpython-in-action
.. date: 2009-07-18 12:03:31-05:00
.. tags: media,books,non-fiction,software,python
.. link: 
.. description: 
.. type: text
-->


[![ironpython-in-action](/files/2009/07/ironpython-in-action.jpg "ironpython-in-action")](http://www.amazon.co.uk/IronPython-Action-Michael-Foord/dp/1933988339)

_by Michael Foord and Christian Muirhead_

Disclaimer: I'm friends with both the authors and was sent a freebie
review copy by the publisher, so I'm bound to be breathlessly gushing in
this review. Fortunately, that's easy to do, because the book really is
great. (Except for Christian's chapters... _Joke!_)

Having spent some years working with .NET, and with a series of
intriguing personal experiments in Python under my belt, I originally
approached IronPython some years ago with a modicum of trepidation. I
feared that the weld between the two would be intrusively visible,
forming distracting differences from regular Python. I feared for the
execution environment, the data types, and perhaps even the syntax
itself.

Experience with IronPython showed these worries were needless. I have
found IronPython to be a remarkably pleasant marriage - the same elegant
language we know and love, given first-class status in the .NET runtime.
Gifted with seamless interoperability with other .NET languages, the
dowry from such an alliance turns out to be all the .NET libraries in
the world, including the substantial and highly capable .NET standard
libraries themselves.

IronPython is, to some extent, a niche implementation of a niche
language. However, its position seems to potentially be one of
importance and strength. Not only does it allow Python programmers to
use .NET libraries - and does so admirably, but it also allows the
existing legions of .NET programmers to be introduced to the joys of
Python. They will fall in love with it, and will be able to introduce it
into their workplaces in a way that is politically acceptable. After
all, it is now simply another .NET language. Since .NET is orders of
magnitude more popular than Python, this could turn out to be an
important source of future Python adoption.

This book is aimed to satisfy programmers coming from both the Python
and the .NET worlds, and in this it seems to succeed. It starts with
quick overviews of concepts from each: 30 pages about Python as a
language, and 17 pages about .NET as an environment (data types, events,
delegates, Windows Forms, etc) - just enough to get everyone up to speed
regardless of background, but without being so verbose as to turn anyone
off with a surfeit of material they are already familiar with. Despite
being brief, these sections are packed with detail and very pragmatic,
focusing on real-world use such as inheriting from existing .NET types,
and solving some common problems like creating Windows Forms
applications from IronPython.

This style of practical and dense informative content is continued
throughout. Straight after the opening sections, we dive right in with
another rapid-fire chapter, demonstrating common IronPython techniques
by writing a non-trivial application. Woven around this ongoing example,
the chapter discusses many immediately important topics, including duck
typing, Python protocols, MVC, using Windows Forms to build a GUI, tab
pages, dialogs, menus, toolbars, images, saving text files, .NET
Streams, text file encodings, Python exceptions and lambda functions.
These diverse topics are covered rapidly but thoroughly, giving the
reader enough information about each to be able to use them together
from IronPython to create a useful project.

Having covered these foundations, the book then moves on to address some
specific areas in more detail. The following chapter headings give you
some idea of the topics which are explored in depth:

-   *First-class functions in action with XML* - demonstrates pragmatic
    use of functions as first-class objects, and higher-order functions
    (functions that take other functions as arguments and return
    modified versions.) and of course decorators. These are shown in
    use, appropriately paired up with the .NET XmlWriter and XmlReader
    classes, demonstrating event driven parsing of XML.
-   *Properties, dialogs and Visual Studio* - Python properties, .NET
    dialogs, and using IronPython in Visual Studio. This sounds like a
    straightforward chapter, but as you might guess, the book gets deep
    into the topics and is jammed full of information. By the end of the
    chapter you'll have added to the example application to create
    document observers, used BinaryFormatter to serialise objects, and
    touched on Python's pickle equivalent.
-   *Agile Testing: where dynamic typing shines* - From the unittest
    module and creating tests, through mock objects, listeners, monkey
    patching, dependency injection and functional testing. This is a
    dense chapter in a dense book, touching along the way on Python
    attribute lookup rules, bound and unbound methods, asynchronous
    execution for functional testing. My only criticism is that it's
    clearly hard for developers to 'get' testing until they have
    hands-on experience of it, so this single-chapter, while very
    thorough in explaining *how* to test, has an ambitious remit, and
    doesn't have enough space to explain much of *why* we test. I guess
    this is partially my own bias shining through here - I regard
    testing as quite literally the most important thing to happen in
    computer science since the invention of the compiler, and would
    encourage anyone interested to go and read as much as they can about
    it.
-   *Metaprogramming, protocols and more* - More Python protocols,
    dynamic attribute access, and metaclasses. The sorts of things that
    in a static language would be deep black magic, or else completely
    impossible, but here they are just the *right* sort of crazy. Read,
    enjoy, and *unlearn*. We see how to create a profiling decorator,
    that modifies the functions you pass to it, wrapping them in
    stopwatch timing calls. We also learn about some of the more
    advanced integration of IronPython with the .NET CLR, including
    static compilation of IronPython code into assemblies, and one of
    the very few additions to Python syntax that IronPython has been
    obliged to provide - the typing of .NET arrays and generics. You'll
    never need to use generics yourself (in Python, everything is a
    generic), and you'll never want to go back to typed containers if
    you can avoid it. However, you may need to deal with some from an
    existing C\# API, and this is how you do it.

Whew! We're only halfway through! The remaining chapters are equally
detailed, but I'm going to start skimming through them somewhat. They
cover the interactions of IronPython with more advanced .NET topics such
as:

-   *Windows Presentation Foundation (WPF) and IronPython* - WPF is
    the DirectX user interface library that is a successor to Windows
    Forms. This includes XAML, an XML dialect for describing user
    interfaces, decoupling their implementation from application logic.
-   *Windows System Administration with IronPython* - using IronPython
    as a scripting language for sysadmin automation tasks, from the
    simple, such as copying files, to the complex, such as Windows
    Management Instrumentation (WMI), administration of remote machines,
    and a substantial discussion on the uses of PowerShell with
    IronPython.
-   *IronPython and* *ASP.NET* - building a web-based front end to the
    sample application developed earlier. Reusable controls.
-   *Databases and Web Services* - using ADO.NET to work with databases,
    and using SOAP and REST.
-   *Silverlight: IronPython in the browser* - creating Silverlight
    applications, and accessing the browser DOM from them.
-   *Extending IronPython with C\#/.NET* - all about creating C\# class
    libraries for use in IronPython, calling unmanaged code from
    IronPython, and creating interfaces on your C\# classes to provide
    dynamic, Pythonic behaviour. It also includes dynamic compilation of
    assemblies at runtime, which opens the door to advanced
    code-generation techniques.
-   *Embedding the IronPython Engine* - many developers might want to
    provide IronPython as a scripting language within their own
    application, and this chapter shows you how.

Alright, that's it! There are appendices:

-   *A whirlwind tour of C#* - in case anyone wants more guidance while
    looking at some of the C# code or concepts that are discussed
    throughout the book.
-   *Python magic methods* - a description of *all* the Python magic
    double-underscore methods, which is a fabulous resource, one which l
    haven't seen collected anywhere else, and have been referring back
    to ever since I read the book.

So there you have it. If you haven't inferred already, I learned
absolutely *heaps* from this book, even though it's about a language and
environment I've been using every day for years. I think I can say
without any equivocation that this is the best IronPython book *in the
world*. If you're a .NET person who is curious about Python (and believe
me, [you](http://xkcd.com/353/)
[should](http://www.paulgraham.com/avg.html)
[be](http://www.python.org/about/success/esr/)), or if you're a Python
person who fancies .NET - maybe for DirectX or Silverlight or any number
of other wonderful things, then you should absolutely go directly to the
[IronPython in Action book website](http://www.ironpythoninaction.com/)
right this second and buy it.

What are you still doing here?

**Update:** Good catch Carl, I forgot the all-important rating!

10/10 if you already use, or are curious about using, IronPython - then
you need this book.

0/10 if dynamic languages make you break out in hives, or if .NET makes
you think of Darth Vader, then you shouldn't touch this book with a
barge pole.
