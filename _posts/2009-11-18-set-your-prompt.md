---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [MSWin-dev]
comments:
- {author: Michael Foord, author_email: michael@voidspace.org.uk, author_url: 'http://www.ironpythoninaction.com/',
  content: 'Thanks! I can never remember how to do this; basically essential for Windows
    command line working. :-)', date: '2009-11-18 18:54:31 -0600', date_gmt: '2009-11-18
    18:54:31 -0600', id: 24410}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: Heh. You're welcome. I posted this trivia snippet because it was unintimidating
    enough to get me going again on my 'Windows development hints and tips'., date: '2009-11-18
    19:46:05 -0600', date_gmt: '2009-11-18 19:46:05 -0600', id: 24412}
- {author: 'tartley.com : More Colored Terminal text on Windows: AnsiCon', author_email: '',
  author_url: 'http://tartley.com/?p=1108', content: '[...] posts on colored terminal
    text is perhaps a bit obsessive. I think I&#039;m all done now.   Posted by tartley
    [...]', date: '2010-07-08 14:23:46 -0500', date_gmt: '2010-07-08 13:23:46 -0500',
  id: 29650}
date: 2009-11-18 16:57:10 -0600
date_gmt: 2009-11-18 16:57:10 -0600
layout: post
published: true
status: publish
tags: []
title: Set your Prompt
wordpress_id: 863
wordpress_url: http://tartley.com/?p=863
---

It's a tiny detail, but the default command-line prompt (on both Windows
and Unix) drives me nuts.

![mswin-command-prompt1](http://tartley.com/wp-content/uploads/2009/11/mswin-command-prompt1.png "mswin-command-prompt1"){.alignnone
.size-full .wp-image-911 width="588" height="297"}

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

![mswin-command-prompt2](http://tartley.com/wp-content/uploads/2009/11/mswin-command-prompt2.png "mswin-command-prompt2"){.alignnone
.size-full .wp-image-912 width="588" height="297"}

There, isn't that better? There are a bunch of other special dollar
codes, that are described
[here](http://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/prompt.mspx?mfr=true).
They only work within this one environment variable, you can't use them
anywhere else.
