<!--
.. title: TIL: MSWindows Programming : Propogating child process exit values out of .bat scripts
.. slug: mswindows-programming-propogating-child-process-exit-values-out-of-bat-scripts
.. date: 2010-01-21 20:04:25-06:00
.. tags: geek,software,mswin-dev,terminal,til
-->

"God *dammit*. Why won't you just DO what I WANT you hopeless pile of
crap!"

So goes the refrain. I think you know where I'm coming from. Yet again,
I have ended up learning far more about crappy DOS scripting than I ever
wanted to know.

So I'm writing a program to automate some small task on Windows. One of
the jobs of this tool is to modify the current environment. But I don't
know how a child process in Windows can modify the environment of it's
parent (namely the command-line shell that invoked it.) Can it be done?

So I hack a ghastly workaround: Wrap the script in a .bat file. A .bat
file is invoked from the command-line in the same process as the shell,
so any change it makes to the environment are made to the environment of
the invoking shell itself. This also has the advantage that the tool can
now be invoked by typing 'toolname', just like on other platforms, as
opposed to 'toolname.py' or even 'python toolname.py'. So I wrap my
Python script 'toolname.py' with a new file, 'toolname.bat', living in
the same directory:

```
:: first run our tool
python "%~dp0%~n0.py" %*

:: then make any changes to the environment
set THIS=THAT
```

The %\~dp0 and %\~n0 gobbledygook is a batch file way of referencing the
same drive, path and filename (minus extension) as the current script,
to which I add '.py' to run toolname.py. Easy enough.

There's a minor problem: The environment changes that need to be made
depend on what goes on inside toolname.py. So I have that Python write a
new batch file to the temp directory, containing all the 'set' commands
which will replace the hardcoded 'set THIS=THAT' in the above script.
Then we call that new temporary bat file from here:

```
:: first run our tool
python "%~dp0%~n0.py" %*

:: then make any changes to the environment
call %Temp%\%~n0-setvar.bat
```

Which is good enough. Presumably it will barf all over the place if run
concurrently. But there's a more pressing problem. I need the exit value
of this tool to be equal to the exit value from toolname.py. Currently,
the exit value of this .bat script is always zero, because the 'call'
command at the end is always successful.

One solution I've seen used is to remember the exit value from
toolname.py, and then use the DOS exit command to propagate this value
out to our caller:

```
:: first run our tool
python "%~dp0%~n0.py" %*
set EXITVAL=%ERRORLEVEL%

:: then make any changes to the environment
call %Temp%\%~n0-setvar.bat

exit %EXITVAL%
```

The problem with this is that 'exit' doesn't do what you think it does.
It doesn't just stop interpreting the current script, rather it
terminates the current interpreter, ie. the shell that is running the
script. If you run this from a command-line, since Windows doesn't
differentiate between a console and a shell, your window disappears.
*Sigh*.

The exit command has a fix for this: It takes a switch '/B', that causes
it to just end the current script, rather than killing the shell. But
now, it ignores any %EXITVAL% parameter you try to feed it, so the exit
value of your batch file is always zero.

This is what I get for developing software on Windows. Nothing ever
works the way it ought to. It's as though everything were designed to
oppose simple engineering idioms, like composing systems out of small,
interchangeable parts.

So here's what I finally did. The exit value of running a batch script
can be set without using the hopelessly brain-dead 'exit' command. It is
equal to the exit value of the last process the script invokes. So
instead of exit, simply find a process that will exit with the value you
need, and invoke it as the final command in your batch script:

```
:: first run our tool
python "%~dp0%~n0.py"; %*
set EXITVAL=%ERRORLEVEL%

:: then make any changes to the environment
call %Temp%\%~n0-setvar.bat

:: and propagate the exit value to our invoker
python -c "import sys; sys.exit(%EXITVAL%)"
```

Bingo. I now have a Python process that can modify the environment of
its invoking shell, and propagates the correct exit value out of the
wrapping DOS script. [Short bow. Applause. Roses. etc.]
