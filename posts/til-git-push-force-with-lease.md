<!--
.. title: TIL: git push --force-with-lease
.. slug: til-git-push-force-with-lease
.. date: 2023-08-04 13:48:19 UTC-05:00
.. tags: til,geek,software,git,version-control,terminal
-->

Don't ever type `git push --force`. Yes, there are times we have to hold our
nose and do a force push. Maybe the project requires contributions to be
rebased or squashed. Maybe we pushed the nuclear launch codes. But there are
failure modes:

* You might be accidentally pushing to or from the wrong branch, and hence are
  about to blow away valuable work at the remote. Yes, is unlikely, and can be
  fixed after the fact, but who knows how much embarrassing disruption and
  confusion you'll cause the team before you realize what you did.
* Do you *always* remember to check the state of the remote, to make sure there
  isn't unexpected extra commits on the remote that you'll unknowingly blow
  away when you push? Do you enjoy always having to type those extra commands
  to pull and check the remote commits?
* No matter how conscientious we are about checking the above, there is a race
  condition. We might check the remote, then someone else pushes valuable
  changes, then we force push and blow them away.

Although there are conventions that can help with all the above (e.g. only ever
force pushing to your own fork, to which nobody else ever pushes), they aren't
generally watertight. (e.g. you might have pushed something yourself, before
vacation, and forgotten about it.)

So the generally agreed method to avoid the above failure modes is "be more
careful", which sounds to me like the common prelude to failure. What we need
are push's newer command-line options:

`--force-with-lease`
: Like `--force`, but refuses to push if the remote ref doesn't point at the
same commit that our local remote-tracking branch 'origin/mybranch' thinks it
should. So if someone else pushes something to the remote's 'mybranch' just
before we try to force push, our push will fail until we pull (and, in theory,
inspect) those commits that we were about to blow away.

It turns out that this is inadequate. One might have fetched an up-to-date remote
branch, but somehow or other ended up with our local HEAD on a divergent branch
anyway:

```
C origin/mybranch
|
B¹   B² HEAD mybranch
 \ /
  A
  |
```

In this situation, `--force-with-lease` will allow us to push, not only blowing
away the original commit B¹, as we intended, but also C, which was maybe pushed
by someone else before we fetched.

To guard against this, we can use the even newer option:

`--force-if-includes`
: This makes `--force-with-lease` even more strict about rejecting pushes,
using clever heuristics on your local reflog, to check that the remote ref
being updated doesn't include commits which have never been part of your local
branch.

Upshot is, I plan to default to always replacing uses of `--force` with:

```bash
git push --force-with-lease --force-if-includes ...
```

That's a lot to type, the options don't have short versions, and it's easy to forget to
do. Hence, shadow `git` to enforce it, and make it easy. In .bashrc or similar:

```bash
# Shadow git to warn againt the use of 'git push -f'
git() {
    is_push=false
    is_force=false
    for arg in "$@"; do
        [ "$arg" = "push" ] && is_push=true
        [ "$arg" = "-f" -o "$arg" = "--force" ] && is_force=true
    done
    if [ "$is_push" = true ] && [ "$is_force" = true ]; then
        # Suggest alternative commands.
        echo "git push -f: Consider 'git push --force-with-lease --force-if-includes' instead, which is aliased to 'gpf'"
        return 1
    fi
    # Run the given command, using the git executable instead of this function.
    $(which git) "$@"
}

# git push force: using the new, safer alternatives to --force
gpf() {
    # Older versions of git don't have --force-if-includes. Fallback to omitting it.
    if ! git push --quiet --force-with-lease --force-if-includes "$@" 2>/dev/null ; then
      git push --quiet --force-with-lease "$@"
    fi
}
```

Then trying to do it wrong tells you how to easily do it right:

```bash
$ git push -f
git push -f: Consider 'git push --force-with-lease --force-if-includes' instead, which is aliased to 'gpf'
[1]
$ gpf
$
```

(The [1] is my prompt telling me that the last command had an error exit value.)


