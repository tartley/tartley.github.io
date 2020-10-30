<!--
.. title: TIL: Git Annotated Tags
.. slug: til-git-annotated-tags
.. date: 2020-10-17 00:40:24 UTC-05:00
.. tags: til,git,version-control,tags
.. category: 
.. link: 
.. description: 
.. type: text
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

Habitually, I've been using:

```bash
git push --tags
```

This is slightly broken, in that it pushes *all* tags. Some tags might be
intended as my private local development state. Some of them might be
unreachable in the origin repo.

To fix this, git push introduced: `--follow-tags`, which aims to address these
issues by:

* Only pushing annotated tags (hence, lightweight tags can be used as local,
  private state)
* Only pushing tags that are on an ancestor of the commit being pushed. Hence
  no unreachable tags are created on the origin.

Or alternatively, just push the tag name directly:

```bash
git push TAGAME
```

Upshot:

* For private local state, use regular lightweight tags.
  Never push them. Hence never use `git push --tags`.
* For public shared tagging, such as releases, use annotated tags,
  pushed either individually by name, or by using `--follow-tags`.

