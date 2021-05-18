<!--
.. title: Use of Asserts in Unit-Tested Code
.. slug: use-of-asserts-in-unit-tested-code
.. date: 2009-11-27 14:47:32-06:00
.. tags: geek,software,python,testing
.. link: 
.. description: 
.. type: text
-->


I pretty much abandoned the use of asserts in production code once I was
introduced to test driven development. Amongst their failings, assert
statements are only suited to testing very localised conditions, such as
within a particular function - it's not clear to me how they can be used
to simply verify the behaviour of a number of objects working in concert
with one another.

Some recent papers have touched on this issue. For example '[Assessing
the Relationship between Software Assertions and Code
Quality](http://research.microsoft.com/apps/pubs/default.aspx?id=70290)'
by Gunnar Kudrjavets, Nachiappan Nagappan and Thomas Ball of Microsoft:
*"We observe from our case study that with an increase in the assertion
density in a file there is a statistically significant decrease in fault
density. Further, the usage of software assertions in these components
found a large percentage of the faults in the bug database."*

However, both assertion density and low defect rates also correlate with
higher levels of developer experience. So, nothing definitive is proven,
but the study has got me thinking. One of the recurring themes in the
*[Coders at
Work](http://www.amazon.co.uk/Coders-Work-Reflections-Craft-Programming/dp/1430219483)*
book that I enjoyed recently, is that several of the expert
practitioners interviewed in the book mentioned how useful they found
thinking about code in terms of its invariants. The use of assertions
does seem to lend itself to testing invariants like this - some quantity
which can be calculated at the start of a function call, and then
asserted to be unchanged by the end of it.

So can assertions be useful even in code that is well unit-tested? Are
there any rules we can use to choose which things might be more
productively tested using such asserts, rather than in unit tests?

I don't know. This is as far as I've got. Thoughts, speculations and
anecdotes welcome.
