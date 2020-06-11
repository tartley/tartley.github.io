<!--
.. title: Show last command exit value in Bash shell prompt
.. slug: show-last-command-exit-value-in-bash-shell-prompt
.. date: 2009-02-05 12:11:57-06:00
.. tags: Geek
.. category: Geek
.. link: 
.. description: 
.. type: text
-->


Stick something like this in your .bashrc file:

``` bash
# display red exit value if it isn't zero
PROMPT_COMMAND='EXITVAL=$?; '$PROMPT_COMMAND
GET_EXITVAL='$(if [[ $EXITVAL != 0 ]]; then echo -n "\[\e[37;41;01m\] $EXITVAL \[\e[0m\] "; fi)'
export PS1="$GET_EXITVAL$PS1"
```

Command exit values other than zero are displayed in the subsequent
prompt:

![Check out the little red '1'](/files/2009/02/last-exit-value.png)

(see the little red '1').

It's the

    ${?#0}

bit which includes the last command exit value in the prompt, unless the
value is zero, in which case nothing is displayed.