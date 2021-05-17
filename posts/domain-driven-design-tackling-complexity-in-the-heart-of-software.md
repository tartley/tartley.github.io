<!--
.. title: Domain Driven Design: Tackling Complexity in the Heart of Software
.. slug: domain-driven-design-tackling-complexity-in-the-heart-of-software
.. date: 2014-01-27 11:05:53-06:00
.. tags: media,books,non-fiction,software
.. link: 
.. description: 
.. type: text
-->


![domaindrivendesign](/files/2014/01/domaindrivendesign.jpg)

*by Eric Evans (2004)* [on Amazon](http://www.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215)

It's a big, dense book -- possibly the most important of the technical
books I've read in a flurry over the last few months, catching up after
recovering a modicum of sanity in our lives after our kid's first year.
I finish it feeling changed, invigorated, and given new direction.

At its core is a simple idea, which sounds neither new nor revolutionary
on the surface. Software projects, Evans maintains, should work closely
with business experts to create and maintain a domain model. The model
might be expressed as a class diagram of core business concerns, and
should also correspond directly to a body of code modelling these
business entities. This forms a set of core business entities which are
clearly analogous to things like the core enterprise entities of the
hexagonal or clean architectures.

However it's created, the terminology and notation used in the class
diagram (or it's equivalent) should be well understood by individuals on
both side of the tech/business divide. In the past I think I've made the
mistake of believing that only developers needed to understand it, and
therefore the model only needed to be expressed in code.

This model should be displayed prominently, referred to continually, and
in a healthy project should very directly correspond to the specialised
language that evolves within the organisation. Where the team's language
doesn't match the model - for example, your business experts' use of
plurals betrays that the cardinality of relationships are modelled
wrongly, then the model - and the underlying code - should be
aggressively refactored to match reality.

Evans makes a persuasive case that the appropriate management of this
complexity at the heart of your software will be a major influence on
the success of the project. To be fair, this is a viewpoint that I
already believed in, so I was a sucker for all of this. Without an
appropriate approach to these central design concerns, over time
developers will find they are no longer able to understand the code
thoroughly enough to be able to modify or extend it easily, unless they
deliberately or inadvertently use design-breaking hacks like redundancy
or mislocated chunks of code. This forms a vicious cycle of technical
debt accrual, and creates an upper limit on the size or complexity which
can be achieved by any project before productivity begins to slump.
Other metrics like reliability then also suffer.

To counter this, conquering these central design issues requires a
pro-active and multi-pronged effort. Firstly, the existing design must
be understood by all parties. In order for this to remain true, the
design needs to be kept up to date and be easily understood by new team
members. The code must be kept directly in sync with the model, and kept
understandable - inappropriate dependencies must be ruthlessly pruned.
Simultaneously, the "correct" design must be discovered iteratively,
throughout the life of the project, and this can only be done by
encouraging continual conversations between developers and business
folks to discuss the potential inadequacies of the current design and
possible alternatives.

When managed correctly, this lends an agility and suppleness to project.
Developers find it easy to integrate subsequent parts of code because
they 'fit naturally' into the existing design, and when the design is
found wanting, it's relatively easy to modify it to incorporate new
concerns.

There are times when I've struggled to convey the message about how the
resulting trade off works between time spent refactoring versus time
saved over the long term. Evans describes this in an interesting way.
Instead of trying to model team productivity by applying a multiplier to
describe drag caused by technical debt, he simply contrasts the normal
way projects slow down as they become larger and more complex, with a
project that instead *speeds up* over time, as developers, unhindered by
a cycle of technical debt, are instead empowered by the creation of
powerful and expressive abstractions, which can then be relatively
easily reconfigured into unanticipated configurations.

To counter-balance this idealistic hand-waving, the next section dives
right into some specific design practices which embody these ideas.
These are valuable and insightful, stock-in-trade, such as
distinguishing between entity and value types. But many of the ideas
were completely new to me, such as the concept of *aggregates*, which
define subsets of the domain model which are always atomically retrieved
from (or updated in) a data store.

In short, I really loved this book. It stretched and inspired me. It's
in a very small set of books I've flagged to re-read in a couple of
years. It's top of my list for 'books to bring in and talk about at
work'.

Rating:

10/10 if you're a programmer, or work with programmers.

0/10 if you're not, or don't.
