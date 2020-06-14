<!--
.. title: Format Python Snippets with Black.
.. slug: format-python-snippets-with-black
.. date: 2020-06-09 19:36:58+00:00
.. tags: python,software
.. link: 
.. description: 
.. type: text
-->

Black, the opinionated Python code formatter, can easily be invoked from your
editor to reformat a whole file. For example, from Vim:

```vim
" Black(Python) format the whole file
nnoremap <leader>b :1,$!black -q -<CR>
```

But often you'd like to reformat just a section of the file, while leaving
everything else intact. In principle, it's easy to tell Vim to just send the
current visual selection:

```vim
" Black(Python) format the visual selection
xnoremap <Leader>b :!black -q -<CR>
```

(Note that both the above Vim configuration snippets map the same key
sequence -- leader (commonly comma) followed by lower case b. These can be
defined simultaneously, because the second one uses 'xnoremap', meaning it is
used only while a visual selection exists, while the first uses 'nnoremap', so
is used all other times.)

But if the given code starts with an indent on the first line, for example if
it comes from lines in the middle of a function, then this won't work. Black
parses the given code into a Python abstract syntax tree (AST), and a leading
indent is a syntax error - it's just not valid Python.

I filed a hopeful [issue with Black](https://github.com/psf/black/issues/1352),
suggesting they could handle this case, but it was a long shot and hasn't
gained much enthusiasm.

So, I present a tiny Python3 wrapper, *enblacken*, which:

* Unindents the given code such that the first line has no indent.
* Passes the result to Black.
* Reindents Black's output, by the same amount as the original unindent.

See [enblacken on github](https://github.com/tartley/dotfiles/blob/master/other/bin/enblacken).
