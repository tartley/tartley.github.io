<!--
.. title: Converting any repository from Svn to Hg on Windows
.. slug: converting-any-repository-fom-svn-to-hg-on-windows
.. date: 2010-10-20 10:26:02-05:00
.. tags: Geek
.. link: 
.. description: 
.. type: text
-->


There's been a lot of
[blather](http://www.voidspace.org.uk/python/weblog/index.shtml) of late
about this supposedly-fiddly conversion process. Personally I've found
that working on the Windows operating system, the transition is a lot
smoother. Simply first install Cygwin, cd to the root of your
repository, and then:

``` bash
find . -name .svn -exec rm -fr {} \;
hg init
hg add .
```

and you're done. There may be a few *nuances* this doesn't address, but
come on, let's not expect miracles.