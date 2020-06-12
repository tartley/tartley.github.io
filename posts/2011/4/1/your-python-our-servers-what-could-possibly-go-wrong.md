<!--
.. title: Your Python, Our Servers : What could possibly go wrong?
.. slug: your-python-our-servers-what-could-possibly-go-wrong
.. date: 2011-04-01 17:33:46-05:00
.. tags: Python
.. link: 
.. description: 
.. type: text
-->


We've been brainstorming for products to build. What do you think of
this one?

**Python Interactive Console in the Browser**

One idea is a CPython interactive console in the browser. Client is
Javascript, which sends the user's Python to execute in a sandbox on our
EC2 instances. Dirigible already has the infrastructure to support
running our user's arbitrary Python in a sandbox across our grid - so
we'd only need to strip the spreadsheet-UI off to expose this
functionality to end-users.

[![Python in the browser](/files/2011/04/python-in-browser.png "Python in the browser")](/files/2011/04/python-in-browser.png)

Your console state is persistant - so you could start some
investigation, or a long-running statement, then log off, and then
reconnect to it later from another machine.

Since the Python runs on our servers, all the client needs is a working
browser with Javascript. You could run code from any device - even funky
things like iPads which don't traditionally make installing and running
Python very easy. Your only hinderance would be the keyboard. Since our
servers could be beefy, it would run substantially faster. We could help
to support running in parallel across several servers.

We could provide multiple versions of Python - and keep them fully
loaded with packages from PyPI - so you could use any combo without
having to install anything locally.

There are already [some](http://www.trypython.org "trypython")
[examples](http://runroot.com/ "runroot")
[of](http://shell.appspot.com "AppEngine shell")
[in-browser](http://www.datamech.com/devan/trypython/trypython.py "datamech")
[Python](http://www.skulpt.org/ "skulpt") consoles like this, but none
of them quite do what we'd hope to do.

We're also thinking of providing really simple tools so you could work
on scripts or programs locally, and then run them in the cloud with a
single command / button.

Generally we're thinking of running your stuff on our own EC2 servers.
Other applications might involve executing stuff on your own servers,
instead of ours, but thus far we haven't come up with applications of
this that offer much over fabric or a combination of an SSH session and
Unix program 'screen'.

Would you use this? What for? Do you think it's totally dumb? I'd love
to hear about it.

*Most* interestingly, would you pay for it? We're thinking free for
trivial uses, a few dollars for some advanced features (access to
networking, persistance) and scale up to support teraflop computing.