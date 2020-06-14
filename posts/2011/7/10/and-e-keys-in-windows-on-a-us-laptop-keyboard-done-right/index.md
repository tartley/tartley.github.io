<!--
.. title: £ key in Windows on a US laptop keyboard, done right.
.. slug: and-e-keys-in-windows-on-a-us-laptop-keyboard-done-right
.. date: 2011-07-10 13:06:34-05:00
.. tags: geek,mswin-dev
.. link: 
.. description: 
.. type: text
-->


The usual solution to typing non-US characters on a US keyboard in
Windows is to hold left-alt, then type on the numeric keypad:

£   Left-alt + 0163

€   Left-alt + 0128

This is a pain on my (otherwise fabulous) Thinkpad laptop, because the
numeric keypad is accessed by holding the blue 'Fn' key while you tap
ScrLk, to toggle numeric keypad mode, and then doing the same again
afterwards to turn it off.

One inadequate alternative (on WindowsXP, YMMV) is to go into control
panel; Regional and Language Options; Languages; Details; Settings. Add
a new keyboard configuration, "United States-International", which
should be grouped under your existing language ("English (United
Kingdom)" for me.) OK all the dialogs, restart your applications.

Now you can simply type:

£   Right-alt + Shift + 4

€   Right-alt + 5

The downside of this solution is that the "UnitedStates-International"
keyboard setting adds a bunch of other features, including 'dead-keys',
whereby quotes and other punctuation are used to add accents to letters,
which is overly intrusive if, like me, you hardly ever use accents.

Ultimate solution then, define your own personal keyboard layout.
Download the Microsoft Keyboard Layout Creator from here:
<http://msdn.microsoft.com/en-us/goglobal/bb964665>.

My end result is an MSI with which I can install a new keyboard layout,
which is exactly like 'US', but with the addition of £ on the key
right-alt + 3:

[windows-US-keyboard-layout-with-pound-on-right-alt-3](/files/2011/07/windows-US-keyboard-layout-with-pound-on-right-alt-3.zip)

The source .klc file is in there, so you could add your own tweaks on
top of that.