<!--
.. title: Set your Prompt
.. slug: set-your-prompt
.. date: 2009-11-18 16:57:10-06:00
.. tags: mswin-dev,terminal
-->


It's a tiny detail, but the default command-line prompt (on both Windows
and Unix) drives me nuts.

![mswin-command-prompt1](/files/2009/11/mswin-command-prompt1.png "mswin-command-prompt1")

See how my cursor is way over on the right. So every command you ever
type gets immediately split over two lines.

This is governed by the PROMPT environment variable. It's the Windows
equivalent of the Unix PS1 variable. You can set this using the
environment variable editing GUI on the System Properties dialog. (I'll
describe a better way to manage environment variables in a later post.)

    set Prompt=$P$_$G$S

The dollar codes are expanded into:

-   \$P - present working directory
-   \$\_ - newline
-   \$G - greater than
-   \$S - space

![mswin-command-prompt2](/files/2009/11/mswin-command-prompt2.png "mswin-command-prompt2")

There, isn't that better? There are a bunch of other special dollar
codes, that are described
[here](http://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/prompt.mspx?mfr=true).
They only work within this one environment variable, you can't use them
anywhere else.
