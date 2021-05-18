<!--
.. title: pip install : Lightspeed and Bulletproof
.. slug: pip-install-lightspeed-and-bulletproof
.. date: 2013-03-08 09:29:09-06:00
.. tags: geek,software,python
.. link: 
.. description: 
.. type: text
-->


I saw a post about [speeding up the Python packaging command "pip
install"](http://www.scottisheyes.com/how-to-fix-slow-pip-install), by
specifying more responsive mirrors for querying and downloading
packages. For my situation, a better tactic is this.

Step one: Download all your project's dependencies into a local
'packages' dir, but don't install them yet:

```shell
mkdir packages
pip install --download=packages -r requirements.txt
```

Step two, install from the 'packages' dir:

```shell
pip install --no-index --find-links=packages -r requirements.txt
```

*(The above syntax works on pip 1.3, released yesterday. Docs for older
versions of pip claim to support this, but in practice, for pip 1.2,
I've had to use "`--find-links=file://$PWD/packages`")*

Step 2 works even if PyPI is unreachable. It works even if some of your
dependencies are self-hosted by the authors, and that website is
unreachable. It works even if the version you have pinned of one of your
dependencies has been deleted by the author (some packages do this
routinely after security updates.) It works even if you have no network
connection at all. In short, it makes creation of your virtualenv
bulletproof.

As a nice side effect, it runs really fast, because it isn't downloading
the packages across the internet, nor is it attempting to scan a remote
index to check for matching or newer versions of each package. This is
much quicker than just using a Pip download cache, especially for large
projects with many dependencies which only change occasionally.

At [Rangespan](http://rangespan.com), we check the 'packages' directory
into source control, so that once you've checked out a project's repo,
you have everything you need to deploy locally and run, even if you have
no network. You might choose to treat 'packages' as ephemeral.

It was pointed out to me recently by
[@jezdez](https://twitter.com/jezdez), Pip maintainer, this usage
pattern has now been [explicitly called out in the
documentation](http://www.pip-installer.org/en/latest/cookbook.html#fast-local-installs),
which was substantially reorganised and improved with the recent 1.3
release.
