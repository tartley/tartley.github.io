<!--
.. title: Postscript formatted man pages
.. slug: postscript-formatted-man-pages
.. date: 2017-08-22 20:34:02-05:00
.. tags: linux,bash
.. link: 
.. description: 
.. type: text
-->


`man` and its `troff` formatting can be asked to produce postscript
output. Define a Bash function, e.g. in your .bashrc:

``` bash
function psman () {
    SLUG=$(echo $@ | tr ' ' '-')
    FNAME="/tmp/man-$SLUG.pdf"
    set -o pipefail
    man -t "$@" | ps2pdf - "$FNAME" && \
      nohup evince "$FNAME" >/dev/null 2>/dev/null
    set +o pipefail
}
```

(I tried to do this without tempfiles, using process substitution, [but
failed. Anyone got better
Bash-fu](https://superuser.com/questions/1243405)?)

The `man -t` is the crucial part. It tells `man` to produce output in
postscript format, which `ps2pdf` can read, and `evince` displays the
PDF. We disconnect the evince process using `nohup`, so that it lives on
even if we kill the terminal. We \`set -o pipefail\` so that if \`man\`
fails, the exit code is preserved as the exit of \`man|ps2pdf\`, which
causes the \`&&\` to short-circuit, preventing evince from being run on
an empty pdf document. We restore \`+o pipefail\` again at the end.

Then, from the command line:

``` bash
$ psman tr
```

produces

[![](/files/2017/08/pman-tr.png)](/files/2017/08/pman-tr.png)

 
