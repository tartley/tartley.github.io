<!--
.. title: Understanding git rebase so it sticks
.. slug: understanding-rebase-so-it-sticks
.. date: 2014-02-07 10:28:37-06:00
.. tags: Software,Git
.. link: 
.. description: 
.. type: text
-->


I endlessly misremember how to use git rebase. That ends today. Here are
my notes to help me remember.

Rebase is traditionally documented as:

``` bash
git rebase [--onto newbase] [upstream [branch]]
```

This is confusing for several reasons. A slight improvement is to rename
the args:

``` bash
git rebase [--onto target] [exclude [include]]
```

Where:

-   `include` is the tip of the branch to be transplanted. If omitted,
    it defaults to the current branch.
-   `exclude` excludes all its ancestors from being transplanted. Hence
    the transplanted branch will have its tip at `include`, and its base
    at the common ancestor of `include` and `exclude`. If `--onto` isn't
    specified, `exclude` is also used as the destination for the
    transplant.
-   `target` is the place to transplant the branch to. If not specified,
    it defaults to the value of `exclude`.

Hence, a simple before and after:

```text
o---o---o---o---o---o exclude
     \
      1---2---3 current branch
                or include
```

```bash
git rebase exclude [include]
```

```text
                exclude
                v
o---o---o---o---o---1---2---3 current branch
                              or include
```

See how the commits to be transplanted start at `include` and go back to
the common ancestor of that and `exclude`. Since `--onto` isn't
specified, `exclude` is also used as the transplant destination.

Or a more complex one:

```text
 o---o---o---o---o target
      \
       o---o---o exclude
            \
             1---2 current branch
                   or include
```

``` bash
git rebase --onto target exclude [include]
```

```text
                    target
                    v
    o---o---o---o---o---1---2 current branch
         \                    or include
          o---o---o
                  ^
                  exclude
```

Again, the commits to be transplanted are defined by `include` and
`exclude`, but this time a separate destination is specified using
`--onto`.

