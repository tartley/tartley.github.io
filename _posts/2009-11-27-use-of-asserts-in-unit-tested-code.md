---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, Testing, Software]
comments:
- {author: matt harrison, author_email: matthewharrison@gmail.com, author_url: 'http://panela.blog-city.com/',
  content: "I also browsed a bunch of Nagappan's papers recently.  It's interesting\
    \ stuff (like where they actually measure the cost of TDD).\r\n\r\nI don't use\
    \ many asserts, but when I read this paper I thought maybe I should start :) \
    \ I do tend to create .validate functions/methods for code/objects that I know\
    \ might not be completely correct or are just complex.  If I know there is an\
    \ easy way to validate it, I'll just throw that into a function as well as use\
    \ it in the unittests.  It also helps to be very specific about where failures\
    \ come from.  Also if you are using code as configuration, it is useful to be\
    \ able to validate that as well.", date: '2009-11-27 17:21:58 -0600', date_gmt: '2009-11-27
    17:21:58 -0600', id: 24561}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Thanks Matt.\r\n\r\nYour idea about using asserts to verify code as configuration\
    \ is a good one - savvy users who are modifying such config may not run the tests\
    \ again, but they surely will be running the application.", date: '2009-11-27
    18:37:30 -0600', date_gmt: '2009-11-27 18:37:30 -0600', id: 24563}
- {author: MANUELG, author_email: MANUELG@GMAIL.COM, author_url: 'http://manuelmoeg.blogspot.com/',
  content: 'In production code, I use asserts to test conditions that I cannot fathom
    how they could be violated, but that I cannot prove or unit-test that the condition
    cannot be violated, in any and all situations. I want the production code to "fail-fast"
    before beginning at the assert, because I know that if the condition IS violated,
    there is zero chance of the algorithm performing correctly. In these cases I am
    privately wishing for the assert to fail, because then I will have learned something
    very surprising.', date: '2009-11-28 04:06:02 -0600', date_gmt: '2009-11-28 04:06:02
    -0600', id: 24568}
- {author: Juho Veps&Atilde;&curren;l&Atilde;&curren;inen, author_email: bebraw@gmail.com,
  author_url: '', content: "Hi,\r\n\r\nFor some reason my original lengthy comment\
    \ didn't make it through... I converted the comment into a blog post which you\
    \ may find at http://nixtu.blogspot.com/2009/11/usage-of-assertions.html .", date: '2009-11-29
    15:02:54 -0600', date_gmt: '2009-11-29 15:02:54 -0600', id: 24583}
date: 2009-11-27 14:47:32 -0600
date_gmt: 2009-11-27 14:47:32 -0600
layout: post
published: true
status: publish
tags: []
title: Use of Asserts in Unit-Tested Code
wordpress_id: 916
wordpress_url: http://tartley.com/?p=916
...
---

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
