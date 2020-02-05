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
title: Dina font as an OFT.
---

The Dina font, converted to oft format: [Dina-v2.93-oft.tar.gz](/assets/2020/Dina-v2.93-otf.tar.gz)

I produced it because Linux font rendering component *Pango* has
[intentionally dropped rendering of bitmap fonts](https://gitlab.gnome.org/GNOME/pango/issues/386#note_570411),
in v1.44.

This version of Pango will be in the next Ubuntu release (20.04, "Focal"). 
To continue using bitmap fonts such as
[my beloved Dina](http://www.dcmembers.com/jibsen/download/61/),
one needs to repackage them as an open type font (.otf),
which Pango will render, and is capable of containing embedded bitmaps.
The process is described here,
[using fontforge to convert the font file](https://gitlab.gnome.org/GNOME/pango/issues/386#note_570411).

There are a couple of gotchas:

* For me, the resulting font is invisible in font selection dialogs. But once
  selected, by clicking around blindly, then it displays fine in applications
  (ie. gnome-terminal.)
* Changing font size in gnome-terminal using Ctrl-+ only cycles over three
  of the bitmap's four defined sizes. I don't know why. But all sizes are
  available, if you select a size explicitly.
* Changing font size in gnome-terminal to one which the bitmap doesn't support
  results in a blank terminal window, rather than falling back to another font.
  :-/

Other tools described in that thread, such as command line `fonttosfnt`,
produce errors on Dina BDFs, or else badly flawed output from the .fon
files, such as losing all size variations.

