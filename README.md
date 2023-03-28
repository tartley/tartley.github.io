# tartley.com

Uses Nikola static site generator.
See output of 'make', with no args, for some handy commands.

# TODO

Fix galleries
- Hack up a nikola fix that injects a webp mimetype before calling .guess_type():
- Submit a PR to Nikola
- Use a cowboyed Nikola to generate tartley.com
* Await Nikola release
* Stop using a cowboyed Nikola on tartley.com

My gallery:
* Finish adding images to the gallery
* Can I get metadata sourced from the image source files?
* Upload the gallery to github pages
* Try the other image viewer option.
* Things I don't like about the default, baguetteBox:
    * Does not support svg, bmp, tiff (aha, out of the box. Perhaps can be fixed
      for svg and any others the browser will display, if nikola passed a 'filter'
      option.)
    * Deep linking to one image displays the raw image file, so users can't go up
      to the whole gallery without manual url wrangling.
    * Can't zoom or fullscreen displayed images.
    * Lengthy captions overlap the displayed image, and captions cannot be turned off
      by the viewer.
    * [feimosi commented n Jun 16, 2019](https://github.com/feimosi/baguetteBox.js/issues/167#issuecomment-502487282)

      > "sorry, I'm really busy nowadays and can't find time to work on v2"

    * I really wish the gallery itself displayed the image title, while the image
      displayed title and description.
    * I wish there was a 'date published' field.
* Do not, under any circumstances, write my own gallery/image pages.
* Come to that, my own static site generator. Am pretty convinced one could do it
  in 10% of the code Nikola uses. But presumably that's just because I don't use
  most of the features. Right?
* Gallery metadata.yml 'order' field doesn't work. My gallery was fine, but
  I'd added the pics in there in reverse order (with ordering from 0 down,
  because I want to add newest pics at the start.) When I reversed the entries
  in metadata.yml, the gallery order went all to hell. Changing order data to
  all positive integers did not help. Do not understand.

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

