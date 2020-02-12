---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: https://www.tartley.com
categories: [Linux,Fonts]
date: 2020-02-05T14:51:33-06:00
layout: post
published: true
status: publish
tags: []
title: Dina font as an OTF.
---

The Dina font, converted to an OpenType Font (.otf) :gift: :package: [:gift: :package: Dina-v2.93-otf.tar.gz](/assets/2020/Dina-v2.93-otf.tar.gz)

<center>~~~</center>

[Pango dropped support for naive bitmap fonts](https://gitlab.gnome.org/GNOME/pango/issues/386)
in v1.44 -- ie. from Ubuntu 20.04, *Focal*, onwards.

So all bitmap fonts need to be converted into a format that will render,
ie. a vector format such as OpenType that allows bitmaps to be embedded.
(Not a conversion of the bitmap into an outline, losing the advantages of
the crisp, tiny bitmaps.)

For most bitmap fonts, this conversion will be done for you, by packagers
or font authors.

But you'll need to do the conversion yourself for any peripheral fonts that
you love, but your distribution doesn't.
Here's how I've managed it for my
[beloved Dina](http://www.dcmembers.com/jibsen/download/61/).

## The conversion process

Good luck!

## 1. Identify the font file.

    fc-list | grep Dina

## 2. Convert.

Use either command line tools, or fontforge.

### 2.1 Using fontforge

A GUI tool.

1. Open up fontforge, paste the font path in.

2. File / generate fonts.

3. Select:

   * Left dropdown: "OpenType (CFF)"
   * Right dropdown: "In TTF/OTF"
   * Generate

The results have some problems. I'm using it in gnome-terminal:

* People converting other fonts report issues with ugly gaps between
  characters. But I don't see that, perhaps because it's a monospace font?
* The converted font is invisible in font selection dialogs, making it look
  like the process did not work. But once selected, by clicking around blindly,
  then the font displays fine in applications.
* Using a font size which is not defined in the font displays a blank terminal,
  instead of falling back to some other font.
* Using ctrl-+/- to select font sizes cycles through three of the four
  defined sizes. I don't know why it skips one. But all four are useable if
  you explicitly select a size.

## 2.2 Using command-line tools

The process is described at
https://fedoraproject.org/wiki/BitmapFontConversion.

Ubuntu's released version of fonttosfnt (1.0.4) produces unusable results:
* Only the 1st and 2nd smallest font sizes are preserved.
* In the 2nd smallest size, all variations are too bold, so that 'bold'
  variations look 'double-bold'. (Italics looks really ugly too, this may
  just be a result of the enboldening.)

TODO: Consider trying the latest fonttosfnt (1.1.0)
https://gitlab.freedesktop.org/xorg/app/fonttosfnt
or at least filing an issue there to try and get some help.

## 3. Install

* Copy to `~/.local/share/fonts` (or `~/.fonts`, right?)
* `fc-cache -f`

## The result

I know, it doesn't look like much. But just you try and show me a vector font
that is half as crisp and clear at this size, much less at the *three sizes
smaller than this* that Dina provides.

![](/assets/2020/terminal-dina-ll.png)

