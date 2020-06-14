<!--
.. title: Unexpected Error
.. slug: unexpected-error
.. date: 2007-08-18 15:33:47-05:00
.. tags: journal,software
.. link: 
.. description: 
.. type: text
-->


So I'm helping a friend create a small website. Casting around for
lightweight tools, I remember that [an intelligent and influential
blogger](http://joelonsoftware.com/), much admired by me, has founded a
software company which produces, amongst other things, [City Desk, a web
site creation tool](http://www.fogcreek.com/CityDesk/).

Checking out their website, I am delighted to find there is a
free-to-use version for small projects much like the one I am embarking
on. I download it, install it, and fire it up eagerly. Just about the
last thing I expected to see was this.

![citydesk-error1.png](/files/2007/08/citydesk-error1.png)\

![citydesk-error2.png](/files/2007/08/citydesk-error2.png)

Just goes to show, creating software which *just works* is a tough
problem. If the likes of Joel can't figure it out, what hope do the rest
of us have...?

**Update:** It looks like the problems are due to my Windows user
account being limited privs. I perform installs and the like with
elevated privs, using the brilliant
[MakeMeAdmin.cmd](http://blogs.msdn.com/aaron_margosis/archive/2004/07/24/193721.aspx).
It looks like running CityDesk for the first time performs some
install-related activities, such as setting up the Platform SDK, which
require admin privs. Once this is done, subsequent runs can be done as a
limited privs user with no problems.