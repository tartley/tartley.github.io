<!--
.. title: Encrypted zip files on OSX
.. slug: encrypted-zip-files-on-osx
.. date: 2012-10-09 10:17:07-05:00
.. tags: OSX-dev
.. category: OSX-dev
.. link: 
.. description: 
.. type: text
-->


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