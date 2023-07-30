<!--
.. title: Pumping Iron : Dynamic Languages on .Net
.. slug: pumping-iron-dynamic-languages-on-net
.. date: 2008-11-25 00:14:11-06:00
.. tags: geek,python,software,presentations
-->


[![](/files/2008/11/oredev-banner.jpg "oredev-banner")](http://www.oredev.org)

This is the talk I gave at the [Øredev
conference](http://www.oredev.org) last week in Malmö, Sweden. I was
stepping in to speak for [Harry Pierson of
Microsoft](http://www.devhawk.net), and although I mixed in content to
make it my own, all the credit for the best bits and the overall gist of
it belongs to Harry, while any errors and oversights are entirely my
own.

This isn't a transcript (I don't think the videos are online yet) - this
is from my memory and my notes, what I imagine I said, together with any
notes and digressions that I wish I'd remembered at the time, historical
revisionist that I am.

**Update:** Now I come to hit [publish] and read this through, it
obviously draws heavily on Steve Yegge's monumental [Dynamic Languages
Strike
Back](http://steve-yegge.blogspot.com/2008/05/dynamic-languages-strike-back.html)
post, which I originally meant to quote directly, but I ended up not
doing, so he didn't get any attrib. Life sucks. Hooray the de facto
creative commons. Thanks for the inspiration, Steve.

**Update2:** There's a [video
online](http://www.dotnet-tv.com/2009/07/20/pumping-iron-dynamic-languages-on-net/).
This text version is better.

[![](/files/2008/11/slide01-pumping-iron.png "slide01-pumping-iron")](/files/2008/11/slide01-pumping-iron.png)

Before we begin, how about a quick show of hands to see where people are
coming from. How many people in the audience are already heavy users of
highly dynamic languages? *\[one or two hands go up\]* So we're talking
about IronPython or regular Python or Ruby or JavaScript, Lisp, Perl,
Lua? Um... Self? And how many people haven't used dynamic languages at
all? *\[no hands go up\]* And so does that mean... people who have done
a small amount of dynamic language programming? *\[just about
everybody's hand goes up\]*. Alright, well that's pretty clear.

![](/files/2008/11/slide02-hands.png "slide02-hands")

Alright. So one of the main themes we'll be looking at is why dynamic
languages are such a minority like that. Clearly if I'd asked who is a
serious user of highly static languages, then everyone would be putting
their hand up straight away. Dynamic languages have such an illustrious
history, and have been such favourites in academia, but why hasn't that
translated into real-world popularity? Projects don't use them, and
people don't learn them much, and if you look at events like PyCon, they
are orders of magnitude smaller than something like Java One. Now that
Microsoft is producing things like IronPython and IronRuby, it's going
to expose a lot of developers to them who previously wouldn't have
picked them up, so we'll be looking at whether you should care, and why
you might consider using these languages for future projects.

![](/files/2008/11/slide02-why-the-fear.png "slide02-why-the-fear")

So why are dynamic languages unpopular? Well if you ask developers, one
of the first things they will say is that dynamic languages are really
slow, so that puts them off.

Also, because of the dynamic nature, it's really hard to do development
environment tools for them. You can't do really good intellisense if the
members of your class, or the type of your object, they are all changing
at runtime, right? So as a result, plenty of environments don't do
intellisense at all, and people have this idea that you just can't do
it.

Then the big one is the type safety thing. This is most people's most
serious issue. How could you manage without the type-checking warnings
from your compiler? I mean, you see dozens or hundreds of those every
day, when you're writing code. So that's hundreds of bugs which were
caught by the compiler and then fixed in five seconds. Without that
process, how could you write bug-free code? So people extrapolate from
that and say that dynamic languages lack the control and rigidity to
scale to large systems.

I think all the things on this slide have an element of truth in them,
but also they overlook some significant counter-arguments, which we'll
look at later, and I think it's ironic that this one, in particular, is
people's strongest objection, because when you look closely at the
type-safety and scalability issue, it is the one objection that holds
least water.

Finally, institutionally as much as individually, people don't like
dynamic languages because they are crazy, and they allow you to do some
weird things that just don't make any sense in a static language. And
people imagine developers going to town, using all these brain-bending
techniques, redefining classes and stuff on the fly, whether it's
appropriate or not, and people imagine there will be all these barmy
knock-on effects permeating the project, unexpected behaviour, False
becomes True, and nobody really understands what's going on any more.

This last point is the least interesting of the things on the slide, so
I'll just discuss this one right here. It's true! It's completely true
that dynamic languages give you more rope to hang yourself with. People
are right to imagine that there are ways that badly thought-out code
could do brain-bending things. But it turns out that this isn't so bad,
because the solution is really, really simple. Namely: Just don't do it.
Just don't sabotage your project by building in wide-ranging unintuitive
side-effects. Which is simply a normal design rule of thumb that you'd
use anyway, right? That's all you need.

![](/files/2008/11/slide03-what-are-they-not.png "slide03-what-are-they-not")

Alright, so before we get into all that, a quick look at what makes a
language dynamic. Note that it's not an all-or-nothing thing. Static
languages contain some dynamic features and dynamic languages contain
some static features. So it's a continuum, with different languages
providing fewer or more of these abilities. Or, alternatively, instead
of more dynamic languages providing various features, after a while you
start to see it more as static languages providing bigger restrictions.
They are so intent on making sure the developer always does the right
thing, that they put up big fences, restricting what the developer can
do.

Also, we're not just talking about dynamic typing, about letting a
variable or an attribute on an object change from being one type to
another. That is one prominent example of something a dynamic language
allows you to do, but there are several other very important facets of
being a dynamic language.

![](/files/2008/11/slide04-dynamic-languages-are.png "slide04-dynamic-languages-are")

Alright, so what are these features that make a language dynamic? Well
Wikipedia's definition is a high-level language that defers a bunch of
stuff until runtime.

**Type Validation**

Type validation is the most obvious example. You aren't declaring values
to be of a particular type, and you aren't declaring operations to
require particular types. So there's no way a compile-time step can
verify that you're passing an integer into the function that expects an
integer. Instead we only check the types of things as we come to use
them - as each line of code executes. So you've lost the compile-time
errors that we mentioned earlier, and in their place we get these
runtime errors, you're trying to divide a date by a string and the
runtime doesn't know how to do that so it throws its hands in the air
and your program is in pieces, all over the floor.

And this would be terrible, because what people imagine is that this is
happening to your user, that your angry client is sitting there looking
at some cryptic traceback, because the lack of static type checking
means that all your errors happen at runtime, which is when the user is
actually using your program, right? But of course this doesn't happen,
because we do actually run the program ourselves before we ship it, so
we see these runtime errors ourselves, and we fix them. Operationally,
these runtime errors become our equivalent of compiler errors. Only,
they are actually better than compiler errors, because they can be way
stricter and more useful than the sort of errors that a compiler is
capable of generating. We'll look at that later. And of course we don't
have to wait for a compile step, so the feedback loop is actually
quicker, which we all know makes a difference in terms of productivity.

**Method Dispatch and Attribute Lookup**

Then you've got method dispatch. Well, everyone's familiar with a type
of runtime method dispatch, when you use polymorphism. So we all know
how that works, and how it brings great advantages to be able to do some
late binding on your method calls. The only difference is, if your
language is dynamic, then all of your method calls are late-bound, all
the time. So it's like polymorphism writ large. There's no need to
restrict polymorphic-type behaviour to some explicitly-labelled methods
of classes in a particular inheritance tree. Everything is late bound,
all the time. So this opens up some new ways of doing things.

Attribute lookup, just the same. In fact the method dispatch, in Python
for example, is just an example of attribute lookup. Because functions
are objects too, right? So if the value of an attribute is a function
object, then you reference the value of the attribute, as `obj.name`,
and the runtime looks for an attribute called 'name' on that object. But
it's not some sort of vtable mechanism, it's actually all done, in
longhand, as it executes. So all the attributes on an object, that's
just a hash table of name-value pairs, And if 'name' doesn't exist in
there, then it looks on the object's class instead. And a class is just
another object, right, with it's own hash table of attributes. And if
'name' doesn't exist there then it starts examining the base classes,
until eventually it finds it, and it provides your code with the value
it finds there. Then your code might choose to call that value by
putting the parenthesis on the end that indicate a method call,
`obj.name()`, right? And you're hoping that the value of this particular
attribute is a function, because if is isn't, then you've got one of
those runtime type errors again. But it is, so the function gets called.

**Inheritance Lookup**

To perform inheritance lookup, well, any class just stores its base
classes, again, that's simply an attribute, the value of which is a
collection of other classes. So the inheritance tree is determined at
runtime by examining what classes you find in that collection, and
there's nothing to stop you modifying that collection, adding or
removing classes as your program executes, changing the inheritance
hierarchy as you go. A typical use might be to create a data-defined
inheritance tree at start-up.

**Type Creation**

We can create new types on the fly. Python provides this thing called
'type', which is really interesting, and we'll chat more about later. We
can call it, and it returns us a brand new class, which we can then use,
just like any other. We'll see an example of this later.

**Parsing**

Finally, we've got abilities like parsing, by which I mean runtime
evaluation of new source code, by which I mean '*eval*'. All the Lisp
guys yawning at the back, because they've been doing this for *fifty
years* now. And anyone who knows a Lisp-like language swears blind that
this is one of the most powerful of programming techniques. But
mainstream languages today just don't do it - and it's mainly just for
the sorts of reasons we outlined earlier.

So, we've deferred all these things until runtime. And it leads to this
classic trade-off, that compilation is this big up-front heavyweight
process, versus abandoning a compile step entirely, in exchange for the
performance penalty of doing all this stuff at runtime. And that doesn't
mean just at program start-up, either. All of these things are done as
each statement executes, meaning the results you get from all of these
operations can actually change, be changed by your code, as it executes.
So this leads to all sorts of interesting and elegant ways to write
programs.

![](/files/2008/11/slide05-omgwtf.png "slide05-omgwtf")

So, the first reaction everyone has to these interesting and elegant new
ways to write programs is to imagine all the awful things you could do.
It becomes a bunch of interesting and elegant ways to break your
program, right? Abandoning the benefits of type safety? Even if you
don't know Python, you can still guess what reassigning to
self.\_\_class\_\_ is going to do, right? And people say 'Aagh!, that's
simply *awful!* ' I can't even imagine all the implications of what that
might do to a running program. I mean, it's difficult enough to develop
software as it is. We're constantly battling with huge lists of bugs in
any system. Why would we want to let go of one of our most fundamental
safety aids, compilation checks? Shouldn't we be looking for ways to
introduce *more* safety, not less?

![](/files/2008/11/slide06-less-safety-sometimes-good.jpg "slide06-less-safety-sometimes-good")

And the answer is: not necessarily. Especially if these new freedoms,
and the loss of type safety are not the huge problems that everyone
assumes they are.

![](/files/2008/11/slide07-what-does-type-safety-buy.png "slide07-what-does-type-safety-buy")

So let's examine what we're really talking about losing when we have no
compile-time type checks. As we've noted, type safety really does catch
and eliminate a whole class of errors, namely whenever you perform an
operation that expects one data type, and you give it another. However,
and importantly, this is not remotely sufficient to have any confidence
that a program actually works, just because it compiles. There are many
other classes of error that can and do commonly happen.

Jay Fields has a marvellous blog post about this, in which he
hypothesises a function performing integer addition. Now, static type
checking can confirm that all uses of your function pass it integers,
and that the return value is always an integer. Obviously this is not
sufficient to assure the function behaves correctly. Nowadays, when we
want to be sure about the behaviour of something like this, we write
unit tests.

Out of interest, how many people here are using unit tests? *\[almost
every hand goes up\]* Alright, excellent, of course you do, you're all
professional, and it's become mandatory, right, because they are so
great. So absolutely everybody wants to be using unit tests, no matter
if you're using a static language or a dynamic language. And your unit
tests get to be very detailed about the runtime behaviour of your
functions, so they don't simply check that your function is returning an
integer, they are testing that 1+1 actually returns 2. Now, 2 is an
integer, right? So once these tests are in place, the static type check
is now redundant. It is providing no value, and can safely be removed.

Cue sharp intake of breath from everyone in the room currently working
on compilers.

Interestingly, when I first started working with Python, I hadn't used
any dynamic language before that, and I was concerned about this myself.
I imagined development could be inundated by multiplying bugs which we
otherwise would have caught cheaply, at compile time. And this has an
element of truth in it - we do find that we get some bugs which normally
would have been flagged by the compiler. But it turns out, in practice,
these errors are only a very small proportion of all the bugs that any
application contains. And also, they are also amongst the most
superficial. We passed in function parameters in the wrong order. We
supplied a string when we should have used an integer. These are the
sort of bugs which are generally trivially easy to locate, identify and
fix. They are not the sort of errors that require hours to track down,
or make you belatedly realise that you need to redesign the whole
project. They are often simple typos, revealed immediately, with a line
number, in stack trace that happens the second you run your application.
In short, the actual cost of losing type safety is, surprisingly,
actually negligible in practice.

[![](/files/2008/11/slide08-money-quote.png "slide08-money-quote")](/files/2008/11/slide08-money-quote.png)

People find this hard to accept. It surprised me. So much effort is
expended maintaining type safety, it's such a pervasive feature of
almost everything we do in a static language, that it seems
inconceivable we could live without it. But interestingly, once we
notice how small the actual benefits of type safety are, the other thing
you start to notice almost immediately afterwards, is that type safety
also comes with a bunch of costs. And these costs are always overlooked,
because type safety is so pervasive that it has become invisible, nobody
even thinks about it when they have to jump through hoops to maintain
it. It's only when you consider *not doing*, by using a language that
doesn't enforce it, that you start to realise how huge the costs
actually are.

These costs come in two forms, both the direct costs of having to jump
through hoops, and also indirect ones, where the restrictions introduced
in the name of type safety will fence off ways of doing things that are
simply made impossible in a static language.

**Examples of the costs of static typing**

So, you've all seen LINQ, which is the new .Net way to query collections
of objects, or arrays, or data sources like XML or databases, using a
single SQL-like language that is now built into the syntax of your
programming language. So C\# can contain these SQL-like statements, not
as quoted strings - they are part of the language. So, I'm not knocking
LINQ here, it does all these really great things. But one of the things
it does, to do all this, is it generates classes that match your
database schema, so that you can access columns in rows of your database
by simple attribute access on a collection of objects. And it turns out
that's a nice paradigm, to have this object model around that matches
your data.

But in order to do that, what LINQ has to do, how it works behind the
scenes, is you have these new programs in your tool chain, these
designers, and they go and interrogate the schema and generate all these
classes to match it. So then you've got all these hundreds of lines of
ugly generated C\#, full of classes and attribute accessors that
negotiate between your code and the data source. This all works great,
but then obviously the schema changes, and you have to go back to your
development environment and regenerate all this code, and then of course
you've got to recompile. I'm being unfair to LINQ, showing all this ugly
code, you're not supposed to ever look at it. But my point is that for
any real schema this code would be enormous, hundreds or thousands of
lines. So it's a big deal, a big heavyweight process, to do all this.

![](/files/2008/11/slide09-linq.png "slide09-linq")

It's such a common problem, because providing types that match your
schema turns out to be dead handy. Everyone has their own solutions to
it. And the Ruby on Rails guys, they have their own version of this.

![](/files/2008/11/slide10-rails-class-to-db.png "slide10-rails-class-to-db")

And it's just that. You inherit from this `ActiveRecord` class. And that
base class, it doesn't do anything clever or magic. It's just a regular
class, written in regular code. And this solution, for the Ruby
developer, is so much simpler and so much better than the LINQ version.
You don't have any changes to your tool chain. You don't have all this
generated code hanging around, waiting to get out of date. You don't
require any recompilation when the schema changes. Heck, with a couple
of the right method calls, you don't even need to restart your
application.

Later I'll show you how to implement things like ActiveRecord, with an
example of an XML deserialiser, that generates types on the fly to match
your XML schema, and populates a document object model using instances
of those types, to match the data stored in a given XML document, and
it's completely general, and it's implemented in 12 lines. I assure you
that the parts of LINQ which provide the equivalent functionality are
not implemented in 12 lines.

![](/files/2008/11/slide11-generics.png "slide11-generics")

Generics are another example. So, generics are AWESOME, everybody knows
this. I remember when I was primarily a C++ jockey, and generics are
just one of the best language features, right? I still look back on the
standard template library (STL), which is such an amazing piece of
design, with a mixture of fondness and awe.

And the point of generics is to let you use arbitrary types in your
collections or whatever. And the reason why generics are awesome is
because it turns out that this is a really, really useful thing to be
able to do.

There's a clue there. If we're listening to it. *The ability to use
arbitrary types in your algorithms turns out to be a really, really
useful thing to be able to do.* And isn't this precisely what dynamic
typing provides? That we should always, in any piece of code, be able to
use whatever type we want. Not just the type that the original writer of
that bit of code anticipated. So the way to think about losing static
typing is not to fret about the loss of compilation errors, but to
consider it as generics on steroids. Every piece of code you or anyone
else writes instantly becomes generic-like in behaviour, without you
having to do anything at all to activate it. It's built in. Always on.
Default behaviour.

But we can't do that in static languages, because it breaks type safety.
So we have to introduce generics to make it sort-of possible, in a
limited way, because it's such a desirable feature to have. But look at
the cost of adding generics to a language. The syntax gets all these
additions, so the language itself becomes more complicated, and harder
to learn and use, and code gets all these template type tags scattered
all through it, the syntax of which is so complex that it effectively
becomes impossible to compose two or more generics together, because the
code is just deluged in an impenetrable torrent of angle brackets. And
to top it off, they only work when the original author goes to all the
expense of bothering to put them in there. The majority of code is
written without generics, and by default cannot be used in a generic
manner unless you want to go and rewrite it to add that feature, which
turns out to be a far less trivial exercise than everyone first expects,
because it turns out that generics come with all these unexpected
complications. This isn't a simple language feature to get to grips
with, and the extra cognitive cost on developers is something we could
simply do without.

Viewed from far enough away, generics begin to seem less like an awesome
language feature, and more like an awful intrusive verbose hack, welded
onto the language design to provide some functionality that other
languages provide for free, and do better to boot.

So these are examples of where static typing gets in the way of
productivity, and produces brittle code, that is not amenable to uses
beyond those directly envisaged by the original creator.

![](/files/2008/11/slide12-what-happens-when-we-let-go.png "slide12-what-happens-when-we-let-go")

So what happens when we let go? Well, Gilad is a smart guy. Obviously he
knows that all these languages are Turing complete, and famously, you
could use any language you like to write any possible program. If it
really came down to it, you can write dynamic features in a static
language, and then use those dynamic features in your program. This is
what happens on a small scale when people make data-driven designs. But
you could take it much further than this, up to and including *eval*,
for example - there's nothing to stop you invoking the compiler as part
of your program execution, right? And conversely, you could implement
some sort of restriction mechanism in dynamic languages, that perform
compiler-like integrity checks at program start up, and then you could
write the rest of your program using that.

In fact, come to think of it, that's basically what unit tests are, but
they are checking specifically for *correct behaviour* rather than
simply enforcing some arbitrary constraint across the board.

So you get all these flame wars, where people are declaring 'Static
languages are just a subset of dynamic languages' and other people are
saying 'No! Dynamic languages are just a subset of static languages!'
and they will never agree because they are both right. But they are both
missing the point, because of course you could do this, but the point is
that you *shouldn't*. It's making things incredibly difficult for
yourself. So when Gilad said the quote above, what he meant was that
dynamic languages make doing some things very, very easy. A natural fit.
Elegantly and directly expressible using the language's normal idioms.
While other languages would make those same tasks orders of magnitude
harder and uglier - obfuscating the implementation by the reams of
scaffolding required to enable the approach.

![](/files/2008/11/slide13-pause-for-breath.png "slide13-pause-for-breath")

So I've been making some bold claims, and I've gotten in a few
dismissive digs. It's worth a calibration point here, to acknowledge
that dynamic languages aren't a silver bullet to all that ails software
engineering. There are circumstances in which they are applicable, and
there are circumstances where static languages are applicable. Only,
historically, that relationship has been out of balance - dynamic
languages have been under-represented, and are far more applicable and
useful than they are given credit for. They need a cheering squad. And
today, that's me.

![](/files/2008/11/slide14-resolver-one.png "slide14-resolver-one")

So, I've talked about a lot of generalities. Let's get specific. People
say you can't build large systems with dynamic languages. Here is one.
Resolver One is the project I work on, we've created a desktop
spreadsheet application for power users, primarily targeted at the
financial industry. It's written entirely in IronPython, and the code
base is about 50k lines of code.

Now, 50k lines of code for Resolver One still isn't a tremendous amount,
it puts us firmly into the small-to-medium project range. But it's worth
noting that 50k of dynamic code encompasses a lot more functionality
than 50k of C\#.

We decided to use IronPython because we knew that we wanted to be .Net
compatible, but also wanted to prototype something rapid in Python,
utilising its high-level features to get some experimental prototypes up
and running as fast as possible. The prototypes went so well that we
decided to write the actual product in IronPython too.

When we made this decision, IronPython was still quite a young project,
and had just been acquired by Microsoft, so we definitely had concerns
about the long-term viability of IronPython, both technically and
politically, as it might have turned out not to be in line with
Microsoft's strategic interests. However, these concerns quickly proved
groundless, as the IronPython project has gone from strength to strength
at Microsoft, and now forms the flagship language on the high-profile
Dynamic Language Runtime, and its future seems very much assured.

One thing that using IronPython has bought us is that it's trivially
easy to embed it in our application as a scripting language. Like
conventional spreadsheets, users can enter expressions in cells, and in
Resolver One, these expressions are fully-functional Python. Obviously a
language without declared type tags is required to meet user's syntactic
expectations. Going a little further, the application then converts the
spreadsheet into a generated Python script, which forms an alternate
representation of the same calculations - the generated script and the
spreadsheet grid are two views of the same model. This script is then
executed, and the outputs from that go to populate the values that are
visible in the grid.

One cool part of this is that the casual user retains the accessibility
of the spreadsheet UI, but once they start to do anything serious with
their spreadsheet, they can see the generated code, visible there in
that middle pane of the UI, and they can change the code. And the
changes they make are re-executed and the results of that calculation
are updated in real-time in the grid. So they can then go to town,
managing the complexity of large, elaborate spreadsheets using all the
techniques that the software industry has been refining for decades:
Functional decomposition, object orientation, 3rd party libraries,
source code control, and the like.

![](/files/2008/11/slide15-hello-world-csharp.png "slide15-hello-world-csharp")

So how can I justify the claim that X lines of code in a dynamic
language provide more functionality that the same number of lines in
other languages? There is a large contribution to this due to the
high-level ability to adopt an appropriate programming approach, as
discussed above. There is also another, more superficial contribution.
To take a simple but illustrative example, I'm sure you've seen this
before. Compare and contrast 'hello world' in C\#, with the same thing
in Python:

![](/files/2008/11/slide16-hello-world-python.png "slide16-hello-world-python")

It's important to notice that the huge reduction in visual complexity
and clutter is not a fluke of this particular example - this is entirely
indicative of exactly how code does change when converted to a language
like Python or Ruby.

There is a tendency for developers to assume a slightly masochistic
attitude towards this, and infer that a programming language that looks
simpler must be less capable, but this is not the case. A lot of the
visual reduction stems from the elimination of type declarations, which
as we've argued earlier, is actually a strength of dynamic languages,
rather than a weakness. Other superficial but very deliberate language
design decisions result in the absence of needless punctuation such as
braces and semi-colons, which provide zero benefit except to clutter the
appearance of the source. The absence of containing class or namespace
scopes in python does not imply that these things are not provided by
Python - on the contrary, these sorts of things are present if required,
and for normal usage they just work automatically, without being
intrusive.

![](/files/2008/11/slide17-dl-tend-to-be.png "slide17-dl-tend-to-be")

So this clean, minimal syntax is coupled with a language which is
actually extremely powerful and expressive - much more so than static
languages, precisely because the sort of restrictions which a static
compiler enforces will prevent you from adopting certain programming
techniques, in case you do something that isn't type safe. The
flexibility and permissiveness of dynamic languages makes them able to
handle approaches that wouldn't otherwise be possible.

![](/files/2008/11/slide18-aspect-oriented-programming.png "slide18-aspect-oriented-programming")

Here's an example of how this flexibility and expressiveness helps.
Aspect oriented programming just means not mixing several different
concerns into the same bit of code. The archetypal example of this is
something like logging. If your application has logging, the code for
that tends to spread all around the code base if left unchecked.

![](/files/2008/11/slide20-logging-initial-highlight.png "slide20-logging-initial-highlight")

You can see that we're only really calling three functions here, the
'do\_' functions on the highlighted lines, but this naive implementation
of the logging and timing code has bloated it out, masking the true
intent of the code.

![](/files/2008/11/slide21-logging-decorator.png "slide21-logging-decorator")

So, one alternative implementation is to *decorate* the functions that
need logging. This is done using this '@' syntax. Importantly, the
implementation of the 'do\_loading' function is not modified in any way
- it just does the loading, and nothing else. Now this 'timed\_op' we've
used to decorate the function, that is actually the name of a decorator
function. The operation of a decorator is this: When 'do\_loading' gets
defined, what actually happens is that the runtime calls the 'timed\_op'
function, passing 'do\_loading' as a parameter. 'timed\_op' then returns
a new function which is used instead of do\_loading, whenever
do\_loading gets called. So a minimal implementation of 'timed\_op'
would be to simply return 'do\_loading' itself. That would make a
decorator which does nothing. More interestingly, we can have timed\_op
return a new function, which calls do\_loading, but which also does
other things before and after the function call. Things like the timer
and logging code:

![](/files/2008/11/slide22-logging-implement-decorator.png "slide22-logging-implement-decorator")

Here it is. 'timed\_op' creates a new function, and returns that
function. It's this inner function, 'time\_and\_log\_func', that gets
called instead of any calls to the decorated function. You can see this
inner function just consists of the timer and logging functionality,
bracketing the call to the unspecified function which we are passed as a
parameter.

So with these in place, our original code simplifies down to:

![](/files/2008/11/slide23-logging-calling-code.png "slide23-logging-calling-code")

This code is not just much clearer than the original. It is literally
unchanged from how it would look if no logging were taking place. We
have entirely separated the concerns of logging from the functionality
being logged. Very cool in this simple example. Unbelievably useful in
the context of a large project.

![](/files/2008/11/slide24-metapogramming.png "slide24-metapogramming")

Another example of the expressibility of dynamic languages is
meta-programming. Code that writes new code. For example, we can
generate new classes at runtime, and then use them exactly as though
they had been part of the program's original source code.

![](/files/2008/11/slide25-deserialise-xml.png "slide25-deserialise-xml")

This is the XML deserialiser I promised earlier. Passed an XML node, it
makes a call to 'type', on the third line of the function, to create a
new class, referenced here by the variable 'pytype'. We pass 'type'
three things: the desired name of the class - the same name as the node;
a list of base classes, in this case just 'object', and a collection of
the class attributes, which is a set of name-value pairs, inside those
curly braces.

The next line creates an instance of our new class, in pyobj.

The first for-loop then creates and sets attributes on pyobj, to match
the attributes of the node.

The second for-loop then creates more attributes on the node, to match
the node's children. This loop is complicated a little by the fact that
there may be many children all with the same name, so we need the value
of these attributes to be a list of child nodes. The empty '\[ \]'
syntax at the end of the 'setattr' call is creating an empty list, and
the last line of this for-loop is then appending a child node to it.

The value of each child node is created by recursively calling this same
function, right at the end of the final line of the second for-loop.

So when we're done, the return value is an object hierarchy
corresponding to our XML document, with attributes on each object,
corresponding to the data contained in each XML tag.

![](/files/2008/11/slide26-first-class-dotnet-citizens.png "slide26-first-class-dotnet-citizens")

So, these sorts of interesting features are going to be available to
.Net developers in the form of IronPython and IronRuby. These languages
are to be considered first-class .Net citizens, and all that implies in
terms of interoperability and Visual Studio support. Michael Foord has a
bunch of [extremely cool demos about using Silverlight from
IronPython](http://www.voidspace.org.uk/ironpython/silverlight/index.shtml).

![](/files/2008/11/slide27-embeddable.png "slide27-embeddable")

I mentioned earlier how Resolver was using IronPython as an embedded
scripting language. This is all it takes to do that, just a few
straightforward lines. You can see the '6\*9' literal down there,
substitute that for the source code of your choice. You can see here
that we're using the current IronPython engine to evaluate this
expression. So if the evaluation has side-effects, they will manifest in
our outer program as well - we can alter variables or create classes or
whatever. If you don't want that, it's equally trivial to grab a new
instance of the python engine instead, so that your scripting is
isolated from your running application, which is what Resolver does,
obviously.

![](/files/2008/11/slide28-extendable.png "slide28-extendable")

It's possible to call into libraries for Python which are written in C.
This is fairly common, in fact, a fair number of Python's standard
libraries are implemented this way, as are some 3rd party libraries.

![](/files/2008/11/slide29-extending-cpython-in-c.png "slide29-extending-cpython-in-c")

The problem with it is that it ain't pretty. It requires a significant
amount of boilerplate C code so that your library exposes the correct
sort if interface to be callable from Python. This is one area that
IronPython scores heavily over regular CPython:

![](/files/2008/11/slide30-extending-ironpython-in-csharp.png "slide30-extending-ironpython-in-csharp")

The interoperability of .Net means you can write regular old C\#, with
no boilerplate, and simply call into it directly. This is obviously very
helpful if you're dealing with some existing C\# code, or if you want to
rewrite some inner loops in a static language for better performance.

Having said that, performance of dynamic languages is something that we
need to discuss. As already mentioned, everyone knows they are terribly
slow. Well, it turns out that isn't the whole story.

We've all seen these benchmarks where Python is 10 or even 100 times
slower than Java or C\#. And Ruby is even slower. On the face of it,
this seems pretty incontrovertible. The problem with benchmarks like
this though, is that they often only address the performance o
languages operating on small, well-understood algorithms. And the
conclusion from benchmarks like this - that dynamic languages are slow
in this sort of circumstance - is absolutely true. You're never going to
get faster performance than a low-level, statically compiled language
for this sort of problem.

However, these are rarely the sort of problem that we care about. In the
real world, the sort of projects we work on are neither small, nor
well-defined. And this has a strange effect on the performance
characteristics of the language you choose.

As the size of a project increases, its performance starts to depend
less and less on the speed of the underlying platform, and more and more
on the algorithms used in the program itself. Which is curious. How
could such a thing come about?

Well, lets examine what we know about performance. We all know the
importance of analysing performance using big O notation. What this has
to teach us in this case is that it doesn't matter if we incur a fixed,
or low order, performance penalty on each operation. What does matter is
when that performance penalty turns out to be N squared or worse in
relation to our problem size. And it just so happens that in aggregate,
the sort of performance penalty that dynamic evaluation incurs, when
compared to compiled code, tends to be somewhere not too far away from
being fixed. Not even linear. I'm just talking about the performance
penalty of using a dynamic runtime here, quite separately from the
performance of your actual business logic.

Obviously this is a colossal generalisation, there's all sorts of
caveats and exceptions, but I'm just describing a rough trend.

Doing some attribute name lookups in hash tables, maybe indirected a few
times, things like that - it costs us, when compared to simple pointer
arithmetic. But that cost doesn't go up tremendously when our hash
tables have lots of values in them. When programs get very long, it
makes no difference. We are still executing the same number of
instructions per second, and if each one is a certain proportion slower,
then that will be our overall slowdown, no matter how long the program
gets. We might always be ten, or even a hundred, times slower than Java
or C\#, but we're not going to get significantly worse than that, no
matter how much the size of the problem increases.

Now, that's well and good. But it still isn't that great, is it? It
means we're dynamic languages aren't much worse for larger problems, but
on the other hand, we're not getting any better either, right? We're
still always going to be much slower than C\# or Java.

But this is where the other half of the equation comes into play. We've
already discussed how dynamic languages give the developer more freedom
to choose an appropriate approach to any given problem. How they require
fewer lines of code to do the same thing. How those lines of code are
very clean and clear in intent. And the effect of all of this is that in
a large, complex project, it's easier for developers to figure out the
most appropriate, performant algorithms to use. The code is easier to
write, easier to think about, and easier to change.

So, as a result, for the same number of man-hours work, on larger
projects, dynamic languages start to claw back some performance compared
to static languages. In fact, these sorts of gains turn out to be
composable, so we can combine an O(N) gain here with an O(log N) gain
there.

The larger the project, the better this gets. Pretty soon, you're
talking serious numbers. The degree to which this is true will obviously
be a matter for some debate. We have very few data points as yet. But
there is a very serious argument to be made in favour of the idea that
dynamic languages do not suffer from poor performance on large projects
remotely as much as benchmarks suggest they might. In fact, the little
experience we have suggests they might actually even be better.

![](/files/2008/11/slide31-performance-gilad.png "slide31-performance-gilad")

There's more. It turns out that there are lots of things we can do to
optimise the performance of dynamic languages, which nobody has ever
been doing. Because when people thought about optimising dynamic
languages, they thought about the types of optimisations that are done
on static languages. And there are a lot of these. We've been thinking
about how to optimise static languages, a lot, for decades now. From the
design of microprocessors to the compiler to the runtime environment, if
it has one, modern static languages have a lot of optimisation going on.

So, the first thing you notice, when you try to optimise a dynamic
language, is that it isn't going to work. The kinds of optimisations you
do to static languages are utterly inapplicable to dynamic languages.
Because you want your compiler to pre-compute as much as it possibly
can, so that the execution of your program has as little work to do as
possible. The runtime execution of a static program is as much on-rails
as you can possibly make it. And this flies in the face of everything
dynamic languages stand for. Their whole purpose is to defer making
these decisions until the moment of execution. So all the clever
optimisation tricks for static languages are utterly useless for dynamic
languages, and so everyone threw their hands up in the air and declared
you can't do it.

Only, it turns out, they were wrong. Because lately people have been
discovering that there are a whole host of things you can do to optimise
dynamic languages. They are just very, very different things than you
would do for static languages.

![](/files/2008/11/slide33-performance-improvements.png "slide33-performance-improvements")

So the upshot of that is that people are only just beginning to realise
that there is plenty of low-hanging fruit when it comes to optimisation,
because it's such an under-exploited field. Unlike for static languages,
which are already heavily optimised, and have nowhere left to go.

Projects like PyPy, does everyone know about that? *\[some shaking
heads\]* These guys have reimplemented Python, using Python. Just like
IronPython is a reimplementation on the CLR. They have all these
incredible lofty goals, but amongst them, one of the side-effects of
their project, is that they are saying they will be able to do
incredible things. Achieve C-like performance with Python. And the
techniques they are talking about include things like the ones Gilad was
alluding to in that last quote. It's actually easier to optimise at
runtime than it is at compile time, because by then you know exactly
what is going on. You know which loops iterate many times, and which
branches get taken, because you can count them go by. You can't do that
with static analysis. And this is vapourware, of course, because they
haven't done it yet.

But all the new javascript engines that have burst on the scene of late,
like V8 for Google Chrome. They aren't vapourware. And the tremendous
performance they are boasting about is the direct result of these recent
insights into dynamic language optimisation. Javascript has been ahead
of the curve, because of the intense competition in the browser space.
But the same techniques are applicable to all the other dynamic
languages, and in the coming years we'll start to see the benefits of
this, in IronPython and IronRuby, and all the other dynamic languages as
well.

So performance might have problematic wrinkles, and a bad reputation,
but the take-home is that it isn't as bad as people think, and it's just
going to keep getting better and better as time goes on.

Alright, what's left?

![](/files/2008/11/slide34-ide-and-tools.png "slide34-ide-and-tools")

So, it turns out a very similar discussion needs to be had about the
traditional weakness of tools for dynamic languages. Everyone thinks
that you can't do things like intellisense, because the IDE can't really
know what the attributes on objects are, since they're all going to
change at runtime.

But once again, this turned out to be too pessimistic. Obviously you can
make a good first order approximation, because we don't dynamically
modify most classes on the fly. So there are rapid gains being made,
both from high-level efforts like, presumably, IronPython's forthcoming
visual Studio integration.

Also, there are great results coming from grass-roots efforts like
[PySmell](http://code.google.com/p/pysmell/), by my colleague Orestis
Markou, who is making a good stab at things like intellisense using
techniques like what he's calling 'duck inferencing' - which is simply
to look at what methods and attributes your source code accesses on an
object, and use that to help you nail down what type of class it is. And
you're not going to get 100% of the right answers using techniques like
that, but it turns out, in practice, that doesn't really matter. They
are still immensely helpful and you can still be extremely productive.

So, the other reason why PySmell is interesting is because it's in its
infancy, and even so, it's still very successful. But it's pretty much a
one-man project, and if you're interested you can easily participate,
it's a very accessible sort of effort. Orestis is keen for the code to
be usable in as many editors and IDEs as possible, so... How many people
here use Visual Studio... *\[Lots of hands go up\]*, right well, it
doesn't work on that yet, so you could pitch in and get that wired up,
or whatever else your environment is, presumably, and make a lot of
people very happy.

![](/files/2008/11/slide35-roadmap2.png "slide35-roadmap2")

So, hopefully this morning I've given you some reasons to be curious
about IronPython, and the forthcoming IronRuby, and maybe even some of
the other dynamic languages too. You can see what the future looks like,
and I don't just mean this slide, right?

![](/files/2008/11/slide36-thankyou.png "slide36-thankyou")

Ok, I think we're done. Thanks very much for listening, Are there any
questions?

*\[deafening silence\]*

**Update:** Oops, I accidentally disabled comments when I originally
posted this, which is a shame. [Thanks to the irrepressible
Voidspace](http://ironpython-urls.blogspot.com/2008/12/pumping-iron-dynamic-languages-on-net.html),
however, it generated [quite a discussion on
Reddit](http://www.reddit.com/r/programming/comments/7m1qk/dynamic_languages_on_net_the_cost_of_compile_time/).
