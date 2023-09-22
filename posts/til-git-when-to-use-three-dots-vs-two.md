<!--
.. title: TIL: When to use three dots vs two in Git
.. slug: git-when-to-use-three-dots-vs-two
.. date: 2015-08-25 11:51:30-05:00
.. tags: til,geek,git,terminal
-->


I endlessly misremember when to use '...' in git versus '..'. That ends
today:

To see the commits or diffs introduced by a branch (the filled circles ●):

```text
     f
    +●  m           git log m..f
     |  ○
    +●  |           git diff m...f
      \ ○
       \|
        ○
```

To see the commits or diffs between the tip of one branch and another:

```text
     f              git log m...f
    +●  m           All commits look the same,
     |  ●-          unless you use --left-right, which
    +●  |           shows where each commit comes from.
      \ ●-
       \|           git diff m..f
        ○           '-' commits are shown inverted,
                     i.e. additions as deletions.
```

To see the commits from 'f' back to the beginning of time:

```text
     f
    +●  m           git log f
     |  ○
    +●  |           (diffs back to start of time are just
      \ ○            the contents of the working tree)
       \|
       +●
        |
       +●
```

Throughout, omitted branchname defaults to current HEAD, i.e, the one of the
above that you almost always want:

``` bash
git diff m...f
```

is the same as

``` bash
git checkout f
git diff m...
```

or

``` bash
git checkout m
git diff ...f
```

Is there a word for unicode ascii art?
