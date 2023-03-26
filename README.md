# tartley.com

Uses Nikola static site generator.
See output of 'make', with no args, for some handy commands.

# TODO

Gallery:
* Hack up a nikola fix that injects a webp mimetype before calling .guess_type():
  * generate the site without exceptions using that,
  * Submit a PR to Nikola
  * Finish adding images to the gallery
  * Get metadata working (descriptions, creation dates)
  * Upload the gallery to github pages
  * Make a note somewhere that I'm using a cowboyed Nikola

Try the other image viewer option. Things I don't like about the default,
baguetteBox:

* Does not support svg, bmp, tiff (aha, out of the box. Perhaps can be fixed
  for svg and any others the browser will display, if nikola passed a 'filter'
  option.)
* Deep linking to one image displays the raw image file, so users can't go up
  to the whole gallery without manual url wrangling.
* Can't zoom or fullscreen displayed images.
* [feimosi commented n Jun 16,
  2019](https://github.com/feimosi/baguetteBox.js/issues/167#issuecomment-502487282)
  "sorry, I'm really busy nowadays and can't find time to work on v2"

Inter-post links. See
https://www.getnikola.com/path-handlers.html
Although the more I lean into Nikola's custom markdown processing,
the more locked-in to it I become.

Embed ancient backed up tartley.com content, and link to it.

# Some commands

Delete all category lines:

    find posts -type f | xargs sed -i '/^\.\. category:/d'

Make all tags lower case

    find posts -type f | xargs sed -i 's/^\.\. tags: .*/\L&/g'

Change tag 'books' to 'book':

    for post in posts/*; do
         sed -i 's/tags:\(.\+\)books/tags:\1book/' "$post"
    done

