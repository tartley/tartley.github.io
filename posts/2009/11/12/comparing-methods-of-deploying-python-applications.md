<!--
.. title: Comparing methods of deploying Python applications
.. slug: comparing-methods-of-deploying-python-applications
.. date: 2009-11-12 12:18:19-06:00
.. tags: Python
.. link: 
.. description: 
.. type: text
-->


I had [a cry](/posts/2009/9/28/python-deployment-sucks.html) last month about
deploying a Python application to end-users being more fiddly and difficult
than I expected it to be. I'm talking about py2exe, Freeze, and their ilk.

As a quick follow-up, I recently [posted to
comp.lang.python](http://groups.google.com/group/comp.lang.python/browse_thread/thread/5abb44388a28ce25/8ce490b3587719e4?lnk=gst&q=directory+python+installed&pli=1)
about a spreadsheet I've made, comparing comparing the solutions I've
found thus far:

<http://spreadsheets.google.com/pub?key=tZ42hjaRunvkObFq0bKxVdg&output=html>

Each column represents a method of distributing a Python application to
an end-user without them having to worry about what Python is or whether
they have an appropriate version of it installed. 'Bundle' represents
manually bundling an interpreter with your application. 'Bootstrap'
represents a sort of fanciful vision of manually creating a compiled
installer which downloads and installs an interpreter if required,
before running your Python application on it. The other columns
represent the various splendid projects like py2exe which perform the
bundling process for you.

Each row represents a reason to choose between them. By my criteria,
which are no doubt idiosyncratic, cx\_freeze or maybe PyInstaller are
starting to look like good contenders for future projects.

Obviously feedback about any wrong-headedness on my part is appreciated.
