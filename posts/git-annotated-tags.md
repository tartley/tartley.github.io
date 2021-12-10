<!--
.. title: Git Annotated Tags
.. slug: git-annotated-tags
.. date: 2020-10-17 00:40:24 UTC-05:00
.. tags: til,git,version-control,terminal
-->

I've previously only ever used git's regular _lightweight_ tags, created with
`git tag TAGNAME`.

Today I learned about _annotated_ tags, created with `git tag -a -m "MESSAGE"
TAGNAME`. If you don't specify `-m MESSAGE`, git annoyingly prompts you for
one, but it will accept `-m ""`.

Annotated tags store the creator, created timestamp, and the message. This
might occasionally be useful for understanding what happened. A release tagged
this way shows us who created the release, and when, which might differ from
when the commit was created.

But more importantly is the different handling of lightweight versus
annotated tags when pushing to the server.

Habitually, I've been using `git push --tags`. But this is slightly broken, in
that it pushes *all* tags. Some tags might be intended as my private local
development state. Some of them might be unreachable in the origin repo.

To address these issues, newer versions of `git push` introduced
`--follow-tags`, which only pushes annotated tags which are on ancestors
of the commit being pushed, so that no unreachable tags are created on origin.

Hence, a better workflow is:

1. Use regular lightweight tags for local state.
   Keep them private by never using `git push --tags`.
2. Use annotated tags to share state with other developers.
3. To share annotated tags, either push them directly, with `git push TAGNAME`,
   or use `git push --follow-tags`.

