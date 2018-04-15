---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python]
comments:
- {author: Daniel Pope, author_email: mauve@mauveweb.co.uk, author_url: '', content: "Using\
    \ a control boolean like 'first' always looks like a smell. There's always a better\
    \ way. In this case you can just write the function as\r\n\r\ndef link(source,\
    \ *filters):\r\n    g = source()\r\n    for f in filters:\r\n        g = f(g)\r\
    \n    return g", date: '2013-10-15 18:52:58 -0500', date_gmt: '2013-10-15 17:52:58
    -0500', id: 310867}
- {author: Patrik Simons, author_email: patrik.simons@neotide.fi, author_url: '',
  content: "I would reuse the same temporary variable:\r\n\r\nrows = read()\r\nrows\
    \ = parse(rows)\r\netc.\r\n\r\nNo careful checking necessary.", date: '2013-10-15
    19:54:58 -0500', date_gmt: '2013-10-15 18:54:58 -0500', id: 310997}
- {author: Hank, author_email: hank.gay+tartley.com@gmail.com, author_url: '', content: 'So
    your original idea was something similar to http://jwilk.net/software/python-grapevine
    ? I''ve been wondering if that library was the way to go, given how different
    it is from standard Python conventions.', date: '2013-10-15 21:07:26 -0500', date_gmt: '2013-10-15
    20:07:26 -0500', id: 311148}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Good call, agreed all over. Article updated. Thanks!', date: '2013-10-16
    08:17:01 -0500', date_gmt: '2013-10-16 07:17:01 -0500', id: 312962}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Yeah, it''s a reasonable point, but one I hear debated back and forth.
    Some people don''t like this style because it breaks their general rule to not
    reuse existing variables for new things. I generally feel like that''s a good
    rule, but could be persuaded to break it in this case. I definitely agree that
    your example is better than the original snippet from my post. But I *still* think
    it''s too wordy, with too many needless temporaries. :-)', date: '2013-10-16 08:20:35
    -0500', date_gmt: '2013-10-16 07:20:35 -0500', id: 312979}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Ha! Brilliant! I *knew* someone must have implemented that already, but
    couldn''t find it. Very interesting to see, thanks for that.', date: '2013-10-16
    08:25:34 -0500', date_gmt: '2013-10-16 07:25:34 -0500', id: 312992}
- {author: xtian, author_email: xtian@babbageclunk.com, author_url: '', content: "(I'm\
    \ glad you changed it from the original \"annoys some of my curmudgeonly colleagues\"\
    .)\r\n\r\nI like it! Although, I think I'd like it more if it took an iterator\
    \ as its first argument, rather than a callable that returns an iterator. Then\
    \ you could relax the restriction that the source callable takes no arguments.\
    \ It makes it slightly less uniform, but I think the source of a pipeline is always\
    \ special.\r\n\r\nPlus that would mean you could pass existing but not yet processed\
    \ generators into it.", date: '2013-10-16 10:45:38 -0500', date_gmt: '2013-10-16
    09:45:38 -0500', id: 313394}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Agreeed all over. It initially bugged me to break uniformity like that,
    but on reflection that''s totally irrational of me. What you suggest is way more
    general and more useful. Post updated!', date: '2013-10-18 08:42:36 -0500', date_gmt: '2013-10-18
    07:42:36 -0500', id: 321507}
date: 2013-10-15 15:09:54 -0500
date_gmt: 2013-10-15 14:09:54 -0500
layout: post
published: true
status: publish
tags: []
title: Chaining a sequence of generators
wordpress_id: 1471
wordpress_url: http://tartley.com/?p=1471
---

I often gravitate towards solutions using a series of chained
generators, in the style of David Beazley's '[Generator Tricks for
Systems Programmers](http://www.dabeaz.com/generators-uk/).'

This results in the outer level of my code calling one generator after
another, terminating in something that consumes the rows, pulling data
one row at a time through each of the generators:

``` {lang="python"}
inputRows = read()
parsedRows = parse(inputRows)
processedRows = process(parsedRows)
outputRows = format_(processedRows)
output(outputRows)
```

where each called function except the last is actually a generator, e.g:

``` {lang="python"}
def parse(rows):
    for row in rows:
        yield int(row)
```

This is great. But my itch is that the top level code above is a bit
wordy, given that what it does is so simple. The reader has to check
each temporary variable quite carefully to be sure it's doing the right
thing.

Fowler's 'Refactoring' describes circumstances when [it's good to remove
intermediate
variables](http://www.refactoring.com/catalog/replaceTempWithQuery.html),
which results in:

``` {lang="python"}
output( format_( process( parse( read() ) ) ) )
```

This is certainly less wordy, and expresses what's happening very
directly, but it annoys some of my colleagues that the called functions
are listed in reverse order from what one might intuitively expect.

I've had this idea in my head to create a decorator for generators which
allows one to chain them in an intuitive order, possibly using some
unconventional notation such as:

``` {lang="python"}
read() | parse | process | format_ | output
```

where 'parse', et al, are now decorated with '@chainable' or somesuch,
which returns an instance of a class that stores the wrapped generator,
and overrides \_\_or\_\_ to do its magic. Maybe 'read' doesn't need to
be invoked manually there at the start of the chain. I haven't really
thought this through.

Luckily, before embarking on that, I realised today I've been
over-complicating the whole thing. There's no need for decorators, nor
for the cute '|' syntax. I just need a plain old function:

``` {lang="python"}
def link(source, *transforms):
    args = source
    for transform in transforms:
        args = transform(args)
    return args
```

**Update**: This code has been improved thanks to suggestions in the
comments from Daniel Pope (eliminate the 'first' variable) and Xtian
(take an iterable rather than a callable for the source.)

This assumes the first item passed to link is an iterable, and each
subsequent item is a generator that takes the result of the item before.

If the final item in the sequence passed to 'link' is a generator, then
this returns a generator which is the composite of all the ones passed
in:

``` {lang="python"}
for item in link(read(), parse, process, format_):
    print item
```

Or if the final item passed to 'link' is a regular function, which
consumes the preceding generators, then calling 'link' will invoke the
generators, i.e. the following is the same as the above 'for' loop:

``` {lang="python"}
link(read(), parse, process, format_, output)
```

There's some rough edges, such as determining what to do if different
generators require other args. Presumably 'partial' could help here. But
in general, 'link' only needs to be written once, and I'm liking it.
