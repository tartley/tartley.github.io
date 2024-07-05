<!--
.. title: TIL: 'Go to Definition' in Vim for Python using Ctags, Done Right
.. slug: go-to-definition-in-vim-for-python-using-ctags-on-windows
.. date: 2010-12-16 20:39:01-06:00
.. tags: geek,software,python,mswin-dev,terminal,til,vim
-->


How to set up and configure Vim to use tags for Python development so
that it doesn't suck.

## Install Ctags

Install the latest version of [Universal Ctags](https://github.com/universal-ctags/ctags),
an active fork of the venerable unmaintained Exuberant Ctags.

## Creating or updating tags files

You'll probably want one tags file at the root of your project, which
will need to be created or updated whenever you make significant
changes. Either get used to manually running the following command a
lot:

``` bash
ctags -R .
```

or bind it to a key in your `~/.vimrc`:


``` vim
noremap <f12> :silent !ctags -R .<CR>
```

I like to set Vim's current working directory equal to the root of
whatever project I'm working in, so now I can press `f12` to update the
tags file for the project.

## Test it out

Now, in Vim, `ctrl-]` will jump to the definition of the symbol under
your text cursor. Hooray, etc. If there is more than one definition of
that symbol, it presents a menu for you to choose from.

## Turn off useless tags

By default, ctags generates tags for Python functions, classes, class
members, variables and imports. The last two are useless to me, and they
actually make `ctrl-]` more inconvenient, because they increase the
likelyhood of finding duplicate definitions of a tag, causing the menu
to inconveniently pop up, rather than just jumping to the tag you want.

To fix this, create a `~/.ctags` file:

``` bash
--python-kinds=-iv
--exclude=build
--exclude=dist
```

The first line turns off tags generation for variables and imports. The
second and third lines turn off generation of tags in the named dirs,
since you almost certainly want to ignore source code in those
directories.

## Case insensitive tag matching

If your .vimrc requests case-insensitive searching by setting
*ignorecase* (aka *ic*), then the above tag matching will also be case
insensitive. This is irksome, because searching for the definition of
property *.matrix* will present you with a menu asking you to choose
between property *.matrix* and class *Matrix*, rather than just jumping
to the property.

To fix this, add this to your .vimrc:

``` vim
" Go to defn of tag under the cursor, using case-sensitive matching,
" then restore the previous case sensitivity setting.
fun! MatchCaseTag()
    let ic = &ic
    set noic
    try
        " tjump jumps directly to a single match, or presents a menu
        exe 'tjump ' . expand('')
    finally
       let &ic = ic
    endtry
endfun
nnoremap <silent> <C-]> :call TagJumpMatchCase()<CR>
```

*This Vim script was suggested in a comment by James Vega, in
order to reliably restore the state of 'ignorecase' after doing the tag
jump. Many thanks!*

This maps your `ctrl-]` key to turn off case-insensitivity while it does
the jump to tag, then turn it back on again. Now pressing `ctrl-]` will
jump directly to your property, only presenting menus on the occasion
when the tag you search for is defined in more than one place using
precisely the same name.

Much better.

**Update:** Also see this post about adding stdlib and venv contents to
your tags:
<https://www.fusionbox.com/blog/detail/navigating-your-django-project-with-vim-and-ctags/590/>
