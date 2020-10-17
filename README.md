# tartley.com

Uses Nikola static site generator.
See Makefile for some handy commands.

# TODO

move "structure of scientific revolution" into posts/2020

Post ideas:
* TIL: git regular lightweight tags vs annotated tags.
  git push --tags vs --follow-tags.
  Re-use existing write up on colorama README-hacking

Urls used to look like:
    https://www.tartley.com/dina-as-otf
but are now like:
    https://www.tartley.com/posts/2020/2/5/dina-as-otf/

What's up with the crazy dual branches model?
See https://getnikola.com/handbook.html#deploying-to-github
What happens if you set GITHUB_SOURCE_BRANCH to master?

Can tags have a hierarchy?
See https://www.getnikola.com/handbook.html#post-taxonomy
If not, consider using categories.

Customize theme to:
    Put tags at top of posts instead of bottom?
    Put tags at top of posts in index

Embed ancient backed up tartley.com content, and link to it.

Disqus: Import old comments? Or can we at least display them?

Check what has happened to old metadata.
Are we leaving anything behind that we care about, eg. old comments.

Skim through handbook for other nice features?
* Social buttons?
* Alt layout for that type of 'short form' post


# Some commands

Delete all category lines:

    find posts -type f | xargs sed -i '/^\.\. category:/d'

Make all tags lower case

    find posts -type f | xargs sed -i 's/^\.\. tags: .*/\L&/g'


# Post Ideas

## Political

I am living in a foriegn land. Educate myself on political history.
Use that as an excuse to broadcast political thoughts to ingrates
on facebook. Examples:

* History of democracy. First democratic nations - how did they each qualify
  it?

* History of republicans vs democrats. Perhaps broken down, ie:

* Fiscal conservatism. Is it real?

* How were modern rights won? Introduced by republicans or democrats? Were
  there protests? Property damage? Riots? To what extent is it true that the
  left has won these valuable rights?
  * Weekends / 40 hour work week
  * Minimum wage
  * Abolition of slavery
  * right to collective bargaining & unions
  * safe workplaces
  * women's vote

## Middle Age

I'm not remotely as mentally agile as I used to be.
* Need more sleep. Or am I just more aware of how lack of sleep affects?
  - presumably both.
* Don't have the mental stamina. Or am I just more aware of how my performance
  degrades after sustained effort?
* My typing, which always contained slapdash typing errors, has now started to
  include odd word substitutions.
* I'm forgetful.
* I lack constancy of purpose. Can I enumerate the aspects of intelligence, and
  see which ones are most affected? Are they quantifiable? Improvable?

