<!--
.. title: Rerun unit tests whenever files update
.. slug: rerun-unit-tests-whenever-files-update
.. date: 2010-10-15 01:43:33-05:00
.. tags: Python,Testing,Software,MSWin-dev
.. category: Python
.. link: 
.. description: 
.. type: text
-->


*In which I once again indulge my obscure command-line fetish.*

I often spend hours of my day cycling through:

-   Edit code and its unit tests
-   Save my changes
-   Push a button or change window focus to explicitly re-run the code's
    unit tests.

Oh frabjous day, the grinding manual labour of the last of these three
steps can now be banished forever, courtesy of `rerun`, a command line
Python script that re-runs a given command whenever it detects changes
to any of the files in the current directory, or its subdirectories.

**Update**: It's Python 2.7, and works great on Windows XP, Macs and
Ubuntu.

For example: I had previously bound f6 in Vim to 'run the current file's
unit tests. Now I've bound shift-f6 to `rerun` the current file's
unit tests in a new console window. This pops up a new window showing
the test results. I then continue editing in Vim, and whenever I hit
save, the unit tests are re-run in the other window. All the while the
focus stays on my editor. It's really sweet!

Thanks for the original idea goes to to the bash command `watch`, and an
old (now offline) blog post by Jeff Winkler.

<https://bitbucket.org/tartley/rerun>