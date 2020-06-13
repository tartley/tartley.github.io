<!--
.. title: Configuration vs Customisation
.. slug: configuration-vs-customisation
.. date: 2007-06-29 18:19:22-05:00
.. tags: imho,gis
.. link: 
.. description: 
.. type: text
-->


I loved a [recent
post](http://geothought.blogspot.com/2007/06/thoughts-on-ges-next-generation-system.html)
by GIS luminary Peter Batty about forthcoming developments in the GIS
industry. However, I was struck by his allusions to a future release of
Smallworld which would dispense of the problems caused by the common
practice of individual clients writing custom software to tailor the
system to their specific needs, by allowing sufficient data-driven
customisation out of the box. I wrote a response which I think I'm going
to post here as well. Suck it up.

My interest and excitement was tinged with a frisson of trepidation, at
the description of the configurable GIS behaviour. I know there's a
whole phalanx of very smart engineers at GE, who are no doubt
immeasurably more cognisant of the following issues than myself. But, as
is my wont, I'm not going to let that get in the way of an opportunity
for a jolly good rant, so here goes.

Obviously data driven behaviour is brilliant. However, it's only good up
to a point. Once the behaviour in question becomes complex enough (and a
GIS definitely qualifies), there's a real risk of the [Inner Platform
effect](http://worsethanfailure.com/Articles/The_Inner-Platform_Effect.aspx):
In an effort to achieve the same levels of flexibility as the
programming languages that it is designed to replace, the configuration
system ends up replicating all their features - badly.

Such an endeavour is caught between two stools. If it is insufficiently
ambitious, the configuration will not be flexible enough to meet
clients' needs. If it does manages to capture the power of the
programming languages it replaces, then it is Turing complete, and all
you have done is convert customisation using a standard, proven,
well-known programming language into configuration using a ghastly
proprietary language that is embedded within your configuration schema.

In addition, creating such a configuration actually ends up being much
harder for clients. It requires deep proprietary skills, as opposed to
common skills like C\#, and it cannot lean on any of the supportive
ecosystem of tools and knowledge that an established language has built
up over the years. Perhaps worst of all, it will \*still\* require
software engineering skills to perform the configuration, and all the
good software engineers will have run a mile.

Like I say, no doubt there are smart people at GE who have been figuring
out solutions to all this for years by now, but I'd have to hear what
those solutions were before I'd trust such a system.

To my way of thinking, the best solution to the problem is to
acknowledge that the best way of specifying behaviour is to use a
programming language - that is exactly what they were designed for.
Trying to sidestep that is simply swimming against the current, and you
need to embrace it. You want a domain specific language (DSL), so that
it is concise and intuitive for clients, but you don't want it to be a
proprietary language - that way lies madness. So what you need is to
provide is a library that extends an existing, established language,
making it into your GIS DSL. Creating DSLs from Python or Ruby is all
the rage these days, and I believe the above chain of reasoning is why.