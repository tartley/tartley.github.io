<!--
.. title: TIL: Shell environment variable tricks
.. slug: til-shell-environment-variable-tricks
.. date: 2024-10-03 15:37:27 UTC-05:00
.. tags: til bash terminal linux software geek
.. type: text
-->

`envsubst` is an executable you likely already have on your PATH (part of the gettext package, often
installed with dev packages), which is a convenient way to replace `$VAR` or `${VAR}` style
environment variables with their values. This allows rendering templates without heavyweight
tools like Ansible, Jinja, or embedding with heredocs. Usage is:

```
envsubstr <template >rendered
```

For example:

```
$ envsubstr <<<"Hello $USER"
Hello jonathan
```

If you'd like to use KEY=value declarations from a dotenv-style `.env` file, you can auto-export
them by setting the `-a` Bash option:

```
set -a; source .env; set +a
```

Something I've managed to avoid ever realizing for 30 years, but now that I've seen it I can't
imagine a week going by without using it. The kind of thing that should be part of everyone's "Week
1 in a terminal" training that formal education courses never include.

