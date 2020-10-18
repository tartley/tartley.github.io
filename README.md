# tartley.com

Uses Nikola static site generator.
See output of 'make', with no args, for some handy commands.

# TODO

Inter-post links. See
https://www.getnikola.com/path-handlers.html

Embed ancient backed up tartley.com content, and link to it.

Next time I publish a Python post, check it appears
on Planet Python.

# Some commands

Delete all category lines:

    find posts -type f | xargs sed -i '/^\.\. category:/d'

Make all tags lower case

    find posts -type f | xargs sed -i 's/^\.\. tags: .*/\L&/g'

