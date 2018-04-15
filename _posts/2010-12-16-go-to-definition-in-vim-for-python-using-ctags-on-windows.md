---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Python, MSWin-dev, Vim]
comments:
- {author: Marius Gedminas, author_email: marius@gedmin.as, author_url: 'http://gedmin.as',
  content: 'I''m curious: why do you find variable tags useless?  IIRC they''re only
    generated for globals, and it''s nice to be able to find those sometimes.', date: '2010-12-17
    14:00:42 -0600', date_gmt: '2010-12-17 14:00:42 -0600', id: 36088}
- {author: Michael Foord, author_email: fuzzyman@voidspace.org.uk, author_url: 'http://www.voidspace.org.uk/',
  content: 'Come on Jonathan, you *know* that setting up tags for vim doesn''t make
    it not suck...', date: '2010-12-17 18:04:28 -0600', date_gmt: '2010-12-17 18:04:28
    -0600', id: 36098}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: "Hey Marius.\r\n\r\nIt's just that I never seem to have a problem instantly\
    \ finding variable definitions. If they aren't local or otherwise obvious, then\
    \ I just hit one or more of  * or # or 0g to find it, hopefully at the top of\
    \ the file. \r\n\r\nConsequentially, the very marginal utility of being able to\
    \ use tags to find them doesn't seem worth the downside to me, of cluttering up\
    \ the tags file. I like it when tags only have a single match, so removing everything\
    \ from the tags file that I don't really need seems like a win to me.\r\n\r\n\
    As for Michael: Quiet, you.", date: '2010-12-19 01:00:58 -0600', date_gmt: '2010-12-19
    01:00:58 -0600', id: 36142}
- {author: James Vega, author_email: jamessan@jamessan.com, author_url: '', content: "As\
    \ for ensuring 'ignorecase' is restored properly, you could wrap it all in a function.\r\
    \n\r\n<code>\r\nfun! MatchCaseTag()\r\n&nbsp;&nbsp;let ic = &amp;ic\r\n&nbsp;&nbsp;set\
    \ noic\r\n&nbsp;&nbsp;try\r\n&nbsp;&nbsp;&nbsp;&nbsp;exe 'tjump ' . expand('<cword>')\r\
    \n&nbsp;&nbsp;finally\r\n&nbsp;&nbsp;&nbsp;&nbsp;let &amp;ic = ic\r\n&nbsp;&nbsp;endtry\r\
    \nendfun\r\n\r\nnnoremap <silent> :call MatchCaseTag()<CR>\r\n</code>", date: '2011-01-31
    17:35:28 -0600', date_gmt: '2011-01-31 17:35:28 -0600', id: 38276}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: That's smashing! Thanks James!, date: '2011-01-31 18:55:57 -0600', date_gmt: '2011-01-31
    18:55:57 -0600', id: 38282}
- {author: Lionel Barret, author_email: lionel@gamr7.com, author_url: 'http://www.gamr7.com',
  content: 'did you look as pyscope ? from our evaluation, it was more complete...',
  date: '2011-03-22 09:36:27 -0500', date_gmt: '2011-03-22 09:36:27 -0500', id: 40413}
- {author: Jonathan Hartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Hey @Lionel. Thanks for the suggestion - I haven''t seen pyscope. Searching,
    there are several projects called pyscope, and I haven''t yet found one with a
    README. Which one do you mean?', date: '2011-03-22 13:53:07 -0500', date_gmt: '2011-03-22
    13:53:07 -0500', id: 40418}
date: 2010-12-16 20:39:01 -0600
date_gmt: 2010-12-16 20:39:01 -0600
layout: post
published: true
status: publish
tags: []
title: '''Go to Definition'' in Vim for Python using Ctags, Done Right'
wordpress_id: 1277
wordpress_url: http://tartley.com/?p=1277
---

How to set up and configure Vim to use tags for Python development so
that it doesn't suck.

Install Ctags
-------------

Get the latest version of [ctags](http://ctags.sourceforge.net/), put it
on your PATH. Recent releases are much improved for Python.

Creating or updating tags files
-------------------------------

You'll probably want one tags file at the root of your project, which
will need to be created or updated whenever you make significant
changes. Either get used to manually running the following command a
lot:

``` bash
ctags -R .
```

or bind it to a key in your \~/.vimrc:

```
map  :!start /min ctags -R .
```

I like to set Vim's current working directory equal to the root of
whatever project I'm working in, so now I can press f12 to update the
tags file for the project. The 'start /min' part is a Windows-specific
way to run the command in the background, so Vim isn't locked up waiting
for it to finish.

Test it out
-----------

Now, in Vim, ctrl-\] will jump to the definition of the symbol under
your text cursor. Hooray, etc. If there is more than one definition of
that symbol, it presents a menu for you to choose from.

Turn off useless tags
---------------------

By default, ctags generates tags for Python functions, classes, class
members, variables and imports. The last two are useless to me, and they
actually make ctrl-\] more inconvenient, because they increase the
likelyhood of finding duplicate definitions of a tag, causing the menu
to inconveniently pop up, rather than just jumping to the tag you want.

To fix this, create a \~/.ctags file:

``` bash
--python-kinds=-iv
--exclude=build
--exclude=dist
```

The first line turns off tags generation for variables and imports. The
second and third lines turn off generation of tags in the named dirs,
since you almost certainly want to ignore source code in those
directories.

Case insensitive tag matching
-----------------------------

If your .vimrc requests case-insensitive searching by setting
*ignorecase* (aka *ic*), then the above tag matching will also be case
insensitive. This is irksome, because searching for the definition of
property *.matrix* will present you with a menu asking you to choose
between property *.matrix* and class *Matrix*, rather than just jumping
to the property.

To fix this, add this to your .vimrc:

```
" go to defn of tag under the cursor
fun! MatchCaseTag()
    let ic = &ic
    set noic
    try
        exe 'tjump ' . expand('')
    finally
       let &ic = ic
    endtry
endfun
nnoremap   :call MatchCaseTag()
```

**Update:**This Vim script was suggested in a comment by James Vega, in
order to reliably restore the state of 'ignorecase' after doing the tag
jump. Many thanks!

This maps your ctrl-\] key to turn off case-insensitivity while it does
the jump to tag, then turn it back on again. Now pressing ctrl-\] will
jump directly to your property, only presenting menus on the occasion
when the tag you search for is defined in more than one place using
precisely the same name.

Much better.

**Update:** Also see this post about adding stdlib and venv contents to
your tags:
<https://www.fusionbox.com/blog/detail/navigating-your-django-project-with-vim-and-ctags/590/>
