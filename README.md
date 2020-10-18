# tartley.com

Uses Nikola static site generator.
See 'make' for some handy commands.

# TODO

Inter-post links. See
https://www.getnikola.com/path-handlers.html

Embed ancient backed up tartley.com content, and link to it.

Check my entry in planet python. Does it match my current:
http://localhost:8000/categories/python.xml
PR and email sent:
https://github.com/python/planet/issues/439

# Some commands

Delete all category lines:

    find posts -type f | xargs sed -i '/^\.\. category:/d'

Make all tags lower case

    find posts -type f | xargs sed -i 's/^\.\. tags: .*/\L&/g'

