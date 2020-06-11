<!--
.. title: History meme
.. slug: history-meme
.. date: 2008-04-23 06:50:01-05:00
.. tags: Geek,Journal
.. category: Geek
.. link: 
.. description: 
.. type: text
-->


``` shell_session
$ history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}' | sort -rn | head
107 ll # an alias for ls -l
92 cd
50 ./next.sh # a script I use during a presentation I've given a lot recently
35 vi
19 imageresize # a script I wrote to shrink photos before uploading them
17 sudo
17 rm
17 gvim
17 ctags # Does 'history' include shell commands executed by mappings within vi?
13 ls
```
