<!--
.. title: Chaining a sequence of generators
.. slug: chaining-a-sequence-of-generators
.. date: 2013-10-15 15:09:54-05:00
.. tags: geek,software,python
.. link: 
.. description: 
.. type: text
-->


I often gravitate towards solutions using a series of chained
generators, in the style of David Beazley's '[Generator Tricks for
Systems Programmers](http://www.dabeaz.com/generators-uk/).'

This results in the outer level of my code calling one generator after
another, terminating in something that consumes the rows, pulling data
one row at a time through each of the generators:

``` python
inputRows = read()
parsedRows = parse(inputRows)
processedRows = process(parsedRows)
outputRows = format_(processedRows)
output(outputRows)
```

where each called function except the last is actually a generator, e.g:

``` python
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

``` python
output( format_( process( parse( read() ) ) ) )
```

This is certainly less wordy, and expresses what's happening very
directly, but it annoys some of my colleagues that the called functions
are listed in reverse order from what one might intuitively expect.

I've had this idea in my head to create a decorator for generators which
allows one to chain them in an intuitive order, possibly using some
unconventional notation such as:

``` python
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

``` python
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

``` python
for item in link(read(), parse, process, format_):
    print item
```

Or if the final item passed to 'link' is a regular function, which
consumes the preceding generators, then calling 'link' will invoke the
generators, i.e. the following is the same as the above 'for' loop:

``` python
link(read(), parse, process, format_, output)
```

There's some rough edges, such as determining what to do if different
generators require other args. Presumably 'partial' could help here. But
in general, 'link' only needs to be written once, and I'm liking it.
