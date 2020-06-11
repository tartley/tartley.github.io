# tartley.com static site generator

Uses Nikola. See Makefile for some handy commands.

## TODO

Read about using Nikola on Google pages.
    https://www.getnikola.com/handbook.html#deploying-to-github
    https://jiaweizhuang.github.io/blog/nikola-guide/

Put in the tartley.github.io repo

Add a gitignore:
    .doit.db
    __pycache__/
    cache/
    output/

Push to prod.

Click around a few pages to see what else does not work.
* package icon in .tar.gz download on:
  http://127.0.0.1:8000/posts/2020/2/5/dina-as-otf.html

License. CC?
https://creativecommons.org/licenses/by-nc-sa/4.0/
<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">tartley.com</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://www.tartley.com" property="cc:attributionName" rel="cc:attributionURL">Jonathan Hartley</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.

Customize theme to:
    Put tags at top of posts?
    Put tags at top of posts in index
    Check it still works with index teasers
    Turn on Index teasers?
        Using a 'description' for posts?
    Put an hr between index posts?
        Maybe they do already? HR in posts is invisible.
    About link in the header?

Categories vs Tags
Categories: A post has one. They can be flat or a hierarchy.
Tags: A post can have many. No hierarchy.
Decide which to use (or both?)
Normalize their case.

Get Disqus working

Check what has happened to old metadata.
Are we leaving anything behind that we care about, eg. old comments.

Import old comments? Or can we at least display them?

Skim through handbook for other nice features?
* Social buttons?

