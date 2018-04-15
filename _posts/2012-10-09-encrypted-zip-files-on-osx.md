---
author: tartley
author_email: tartley@tartley.com
author_login: tartley
author_url: http://tartley.com
categories: [OSX-dev]
comments:
- {author: Harry, author_email: hjwp2@cantab.net, author_url: 'http://www.tdd-django-tutorial.com',
  content: 'What''s wrong with Keepass?', date: '2012-10-09 11:25:44 -0500', date_gmt: '2012-10-09
    10:25:44 -0500', id: 64143}
- {author: xtian, author_email: xtian@babbageclunk.com, author_url: '', content: "Keeps\
    \ too much ass.\r\n\r\nAmirite?", date: '2012-10-09 12:09:08 -0500', date_gmt: '2012-10-09
    11:09:08 -0500', id: 64144}
- {author: Tim Golden, author_email: mail@timgolden.me.uk, author_url: '', content: This
    is of course where 25 people pile in to let you know about the entire mini-industry
    devoted to solving exactly this problem on OSX!, date: '2012-10-09 12:30:50 -0500',
  date_gmt: '2012-10-09 11:30:50 -0500', id: 64145}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: 'I do use KeePass, but haven''t transferred the majority of my secret data
    over to it because lots of my secret data seems to be unstructured text rather
    than username/password combos. Plus, darn-it-all, I really like being able to
    view it in my favourite text editor, complete with a decent search and the like.',
  date: '2012-10-09 12:44:17 -0500', date_gmt: '2012-10-09 11:44:17 -0500', id: 64146}
- {author: xtian, author_email: xtian@babbageclunk.com, author_url: '', content: "I\
    \ use Codebook on iOS, for the same predominantly-unstructured-text reason. They've\
    \ got a contact form - you should lobby them to do one for Android. Also it's\
    \ backed by SQLCipher, which is an encrypted extension of SQLite. It's pretty\
    \ straightforward to build from source. \r\n\r\nI don't think it would be that\
    \ hard to write a command-line client that would open the database, prompt for\
    \ your password, let you select an entry, plop that into $EDITOR, and then write\
    \ the results back. But it would definitely be more than your little script. One\
    \ benefit would be that it doesn't decrypt the whole password file and leave it\
    \ sitting in your filesystem - only the note you're editing is exposed.", date: '2012-10-09
    16:59:47 -0500', date_gmt: '2012-10-09 15:59:47 -0500', id: 64152}
- {author: xtian, author_email: xtian@babbageclunk.com, author_url: '', content: I'm
    surprised Merlin Mann isn't already here telling you about OnePassword and TextExpander
    and SquareSpace and..., date: '2012-10-09 17:01:31 -0500', date_gmt: '2012-10-09
    16:01:31 -0500', id: 64153}
- {author: Nick, author_email: Nfurness@nixta.com, author_url: '', content: 'FWIW,
    JB, I use 1Password which encrypts notes too. But that admission is probably not
    cool in this worldspace (for some reason I''m probably not cool enough to understand
    :))', date: '2012-10-19 20:15:47 -0500', date_gmt: '2012-10-19 19:15:47 -0500',
  id: 64364}
- {author: tartley, author_email: tartley@tartley.com, author_url: 'http://tartley.com',
  content: This still makes me laugh. Ohdear., date: '2012-12-04 15:16:27 -0600',
  date_gmt: '2012-12-04 15:16:27 -0600', id: 67913}
- {author: Mimi Flynn, author_email: mimiflynn@gmail.com, author_url: 'http://mimiflynn.com',
  content: 'I''ve been using ENCFS to store sensitive files: http://www.arg0.net/encfs
    . Its not been updated in a while, it seems, but it seems that it might be helpful
    in your situation.', date: '2013-09-26 19:12:34 -0500', date_gmt: '2013-09-26
    18:12:34 -0500', id: 245715}
date: 2012-10-09 10:17:07 -0500
date_gmt: 2012-10-09 09:17:07 -0500
layout: post
published: true
status: publish
tags: []
title: Encrypted zip files on OSX
wordpress_id: 1392
wordpress_url: http://tartley.com/?p=1392
---

My passwords and other miscellany are in a plain text file within an
encrypted zip. Since starting to use OSX I've been looking for a way to
access my passwords such that:

-   I get prompted for the decryption password.
-   The file gets unzipped, but not in the same directory, because
    that's synced to Dropbox, so would send my plaintext passwords to
    them every time I accessed them. Maybe to /tmp?
-   The plaintext file within the zip is opened in \$EDITOR.
-   Wait for me to close \$EDITOR, then remove my plaintext passwords
    from the filesystem.
-   Before deleting the passwords, check if I've updated them. If so,
    put the new updated version back into the original zip file.
-   Don't forget to keep the updated zip file encrypted, using the same
    password as before, without prompting for it again.

I failed to find an existing app which would do all this (although I had
no trouble on Linux or even on Windows.) Hence, resorting to good old
Bash:

``` bash
#!/bin/bash

ZIPDIR="$HOME/docs/org"

read -s -p "Password:" key

cd $ZIPDIR
unzip -P $key passwords.zip passwords.txt -d $TMPDIR
if [[ $? != 0 ]] ; then
    exit 1
fi

cd "$TMPDIR"
touch passwords.datestamp
$EDITOR passwords.txt
if [[ passwords.txt -nt passwords.datestamp ]] ; then
    zip -P $key -r "$ZIPDIR/passwords.zip" passwords.txt
fi

rm passwords.txt
rm passwords.datestamp
```

I don't expect this to be watertight, but seems good enough for today.
I'm happy to hear suggestions.
