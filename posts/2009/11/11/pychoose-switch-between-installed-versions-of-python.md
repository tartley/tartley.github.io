<!--
.. title: PyChoose: Switch between installed versions of Python
.. slug: pychoose-switch-between-installed-versions-of-python
.. date: 2009-11-11 16:07:10-06:00
.. tags: Python
.. link: 
.. description: 
.. type: text
-->


You can switch between different installed versions of Python by simply
prepending to your PATH. However, this goes wrong in some scenarios,
such as when a tool like 'virtualenv' is installed in one Python
version, but not in another. Pretty soon you will be executing your
project with one Python version, but referencing the site-packages of
another. When switching, other versions of Python need to be stripped
from your PATH.

As a solution, I present a new Python module, *pychoose*. For the moment
this is Windows only:

```text
>python -V
Python 2.6.4
>easy_install pychoose
...
>pychoose 24
(Py24) >python -V
Python 2.4.4
(Py24) >exit
>python -V
Python 2.6.4
```

It prepends to the PATH as above, but it also filters other Python
versions out the PATH. It modifies the PROMPT to show the user they are
operating in a modified environment. It works by spawning a new shell
with the modified environment. To return to your default Python
interpreter, type 'exit'.

PyPI page: <http://pypi.python.org/pypi/pychoose>

Subversion repository:
[http://code.google.com/p/pychoose](http://code.google.com/p/pychoose/)

Preview the module [source
code](http://code.google.com/p/pychoose/source/browse/trunk/pychoose_script.py).

It seems to work for simple scenarios, but there are a bunch of known
problems with it (see the PyPI page above), which I'd like to fix if
people think this is useful. I just whipped this up and don't really
understand the issues surrounding this. In particular is spawning a new
shell the best way to modify the current console's environment? Is a
less-instrusive alternative to generate .bat file which can be executed
to change the current shell's environment?

Feedback & suggestions very welcome.
