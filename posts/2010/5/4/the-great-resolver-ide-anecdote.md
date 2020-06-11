<!--
.. title: The Great Resolver IDE Anecdote
.. slug: the-great-resolver-ide-anecdote
.. date: 2010-05-04 12:56:47-05:00
.. tags: IMHO,Software
.. category: IMHO
.. link: 
.. description: 
.. type: text
-->


Found myself telling this story yet again, so I figured I should just
post it here and start linking to it, rather than remembering, retyping
and re-embellishing it every time.

Ever since we started at [Resolver](http://www.resolversystems.com/),
developers have been free to choose their own IDE (Integrated
Development Environment, although some of the ones I'm going to talk
about aren't so integrated, so I guess you should just read 'IDE' herein
to mean 'development environment').

Like herding cats, this of course resulted in everyone choosing a
different IDE. At one peak, we had fourteen people, and about ten
different IDEs. Sigh. To our incredulity though, this worked fine, and
everyone was happy. So far, so good.

We pair program, so we see a lot of each other's IDEs. In fact, we end
up learning them all pretty thoroughly. Spending eight hours a day,
every day, using someone else's IDE, with a bona-fide expert in that IDE
sitting in your lap, guiding you through it, will tend to do that. After
a few months, we all knew every IDE out there back-to-front. An example
of how pairing spreads knowledge.

Every so often, someone would change their mind about their chosen IDE.
Having been educated about the alternatives, they would decide to
switch. This was also fine, and everyone continued to be happy.

Then, after a few months of this, an interesting thing happened.
Gradually, one by one, twelve of our fourteen people each decided, of
their own accord, to switch to using either Vi or Emacs.

I regard this of an example of pairing not just spreading knowledge, but
spreading *enlightenment*.

They each had realised that although these hallowed text editors didn't
have some of the more advanced features they'd come to expect from an
IDE, such as auto-completion or 'go to definition', they were flexible
and powerful enough that one could add such features yourself. To do so
is a rite of passage for an experienced programmer, akin to Luke
building his own lightsaber - so that it's customized to his precise
needs, and he understands each nuance of its behaviour.

More than that, all the conveniences of a traditional IDE made it very
convenient to do only what the authors of the IDE had envisaged. To do
anything else was made very difficult. If you wished to use a different
compiler, or write in a different language than those prescribed by your
IDE vendor, you were out of luck, and would have to learn an entirely
different IDE to do that.

> *"We shape our tools and afterwards our tools shape us."*
>
> - Marshall McLuhan ('The media is the message' guy)

On one project, or two, this might seem a trivial restriction. Extended
over the course of a lifetime, the conveniences shields a developer from
learning anything other than how to drive an IDE, and the restrictions
become blinkers, crippling their scope and abilities. The IDE is a
cage... for your *mind*.

![](/files/2010/05/matrix_morpheus_red_blue_pill.jpg)

The outliers are worth noting: We still use Visual Studio on rare
occasions, for the lovely built-in GUI designer. The irrepressible
Michael Foord loves Wing, and stuck with that. Will Reade, our tame
brainiac, stuck with transparent simplicity of the lightweight but
surprisingly useful TextPad. Go figure.

**Update**: The coda to the outliers is also interesting. Nowadays we're
embedded in a huge mission to free our codebase from embedded win32
controls, so that we might have a chance of running under Mono, and
hence on other platforms. It would be nice if we could escape Windows
Forms altogether - I understand WPF would let us display our GUI on the
web. Writing this post makes me wonder - if we hadn't been using Visual
Studio's convenient GUI designer all along, is it remotely possible that
we might have considered our choice of GUI layer more thoroughly? If we
hadn't been entranced by the "obviously right" convenience of the Visual
Studio GUI designer, might our minds have been free enough to have made
this decision right the first time around?