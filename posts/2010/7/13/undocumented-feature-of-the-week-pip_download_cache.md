<!--
.. title: Undocumented feature of the week: $PIP_DOWNLOAD_CACHE
.. slug: undocumented-feature-of-the-week-pip_download_cache
.. date: 2010-07-13 12:46:15-05:00
.. tags: Python
.. category: Python
.. link: 
.. description: 
.. type: text
-->


Use Python? You should be using
[*Pip*](http://pypi.python.org/pypi/pip). A replacement for
*easy\_install*, that supports uninstalling and plays nice with
[*virtualenv*](http://pypi.python.org/pypi/virtualenv). An *apt-get* for
Python packages, if you will.

It has a marvellous undocumented feature. Set the environment variable
PIP\_DOWNLOAD\_CACHE to prevent re-downloading the same packages
repeatedly when setting up environments on the same machine:

``` shell_session
> set | grep PIP
PIP_DOWNLOAD_CACHE=C:\Documents and Settings\jhartley\.pip_download_cache

> pip install mock
Downloading/unpacking mock
Creating supposed download cache at C:\Documents and Settings\jhartley\.pip_download_cache
 Downloading mock-0.7.0b2.zip (242Kb): 242Kb downloaded
 Storing download in cache at c:\documents and settings\jhartley\.pip_download_cache\http%3a%2f%2fpypi.python.org%2fpackages%2fsource%2fm%2fmock%2fmock-0.7.0b2.zip
[snip]
Successfully installed mock

> pip uninstall mock
[snip]
 Successfully uninstalled mock

> pip install mock
Downloading/unpacking mock
 Using download cache from C:\Documents and Settings\jhartley\.pip_download_cache\http%3A%2F%2Fpypi.python.org%2Fpackages%2Fsource%2Fm%2Fmock%2Fmock-0.7.0b2.zip
[snip]
Successfully installed mock
```

(This text is copied from my unholy bastardised shell of choice at work,
Windows CMD shell with Cygwin binaries foremost on the PATH.)

Using the download cache like this is substantially faster. Exactly what
you need if you're continually setting up environments under various
version of Python for testing or what-have-you.

The directory is created if it doesn't exist. Network access is still
required when installing like this, presumably for the version checks.

Thanks to the irrepressible
[fuzzyman](http://www.voidspace.org.uk/python/weblog/arch_d7_2010_07_10.shtml#e1185)
for bringing this to my attention.