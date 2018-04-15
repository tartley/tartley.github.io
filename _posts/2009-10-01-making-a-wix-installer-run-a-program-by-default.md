---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [Software]
comments:
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Thanks Tom! We figured publishing this was helpful to some poor souls
    out there because we could not successfully find any information on how to get
    said checkbox checked by default, but a bit of guesswork led to the answer above.',
  date: '2009-10-01 18:28:44 -0500', date_gmt: '2009-10-01 17:28:44 -0500', id: 23657}
- {author: xtian, author_email: xtian@babbageclunk.com, author_url: '', content: Only
    least favourite since I left!, date: '2009-10-02 07:35:12 -0500', date_gmt: '2009-10-02
    06:35:12 -0500', id: 23668}
- {author: David Jones, author_email: drj@pobox.com, author_url: 'http://drj11.wordpress.com/',
  content: 'ah, you mean Tom really exists?  I thought for a moment that "Tom" might
    be you, tartley, when you were made to write windows installers.', date: '2009-10-05
    15:04:21 -0500', date_gmt: '2009-10-05 14:04:21 -0500', id: 23711}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'Tom is one of my many superlative workmates. He purportedly finds existence
    to be an over-rated quality, but nevertheless it is one which he indubitably possesses.
    Tom and I were pair-programming on the day in question.', date: '2009-10-06 13:29:59
    -0500', date_gmt: '2009-10-06 12:29:59 -0500', id: 23720}
date: 2009-10-01 18:27:29 -0500
date_gmt: 2009-10-01 17:27:29 -0500
layout: post
published: true
status: publish
tags: []
title: Making a wix installer run a program by default
wordpress_id: 847
wordpress_url: http://www.tartley.com/?p=847
---

***Guest post by my least favourite colleague, Tom.***

Normally - but not always - people want to run a program just after the
install it - you can help then to do this by using an opt-out system
with a checkbox checked by default

To create the checkbox and control whether it is set you must use the
following properties in your **Product** section:

``` xml
Id="WIXUI_EXITDIALOGOPTIONALCHECKBOXTEXT"
Value="Launch the cool program"
Id="WIXUI_EXITDIALOGOPTIONALCHECKBOX"
Value="1"
```

The value of `WIXUI_EXITDIALOGOPTIONALCHECKBOX` controls the
checkboxes checkedness.

You then need a custom action to do some launching:

``` xml
Id="LaunchApplication"
BinaryKey="WixCA"
DllEntry="WixShellExec"
Impersonate="yes"
```

and some UI wiring in the **UI** element under the **Product** element
to get you custom action called.

``` xml
Control="Finish"
Event="DoAction"
Value="LaunchApplication"&gt;WIXUI\_EXITDIALOGOPTIONALCHECKBOX = 1 and
NOT Installed
```

Huzzah - you now may have a working installer.
