# tartley.com Jekyll site

## Initial Jekyll site steup

Instructions at:
https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/

With amendments:

### gem install --user-install

    gem install bundler

fails without write permissions to `/var/lib/...`. Fix it with:

    gem install --user-install bundler

and add `~/.gem/ruby/2.3.0/bin` to my PATH in `~/.bash_profile`.

### apt install ruby-dev

    bundle install

fails to build ruby packages. Must first:

    sudo apt-get install ruby-dev

## Importing from wordpress

Instructions at:
https://import.jekyllrb.com/docs/wordpress/

Import command with params added is stored in bin/wordpress-export

    ruby -rubygems -e 'require "jekyll-import";
    etc

Fails because I haven't installed prereqs:

    apt-get install libmysqlclient-dev
    gem install --user-install jekyll-import unidecode sequel mysql2 htmlentities

And fails because I need an ssh tunnel to access the mysql instance:

    ssh -L 3306:127.0.0.1:3306 tartley@web578.webfaction.com

(leave open for as long as needed)


# TODO ########################################################################

* images
* delete all the thumbnail images before committing?

* syntax highlighting: fix language markup

    ``` {lang="X"}

    is there rouge support for DOS/CMD ?

    check 'bash' instances to see if they should be 'shell_command' or whatever it is

    ``` {other...}

    plain indented

    bare ```

* syntax highlighting in solarized

* Can we preserve old post urls?
    Post prefix data includes wordpress id

* links between posts should be relative
* search for remaining references to 'tartley.com/...'
* search for remaining references to 'wp-content'
* search for remaining references to 'uploads'

* html entities in post titles
    * on index
    * in posts?

* show post categories in post

* show post categories in home

* about

* site header
  much smaller
  remove the 'view on github'

* footer

* labouriously check all posts

* Point domain name to the new github pages site.

* Migrate ancient backed-up tartley.com content to github pages

* Drop webfaction?
  Are there other services of theirs that I need?
  * email
  Do any of my secondary sites need to stay up?
  Grab the content for secondary sites.

* https:
  letsencrypt:
  Figure out how to use certbot with my webfaction account
  ie. what webserver does it use?

* Display old comments?
* suggest a place to leave new comments? In the post template?

# Done ########################################################################

* backup

* What static site generator should I use?
    Jekyl

* Can I host somewhere free, like github?
    Yes, github pages
    which has special support for jekyll

* Can that go behind tartley.com?
    Yes, with suitable domain config

* Create a visible Jekyll site

* Migrate wordpress content into github pages

* Convert html posts into .md

* do i need to do over the html to md conversion setting explicit_end='---' ?

* check those unicode chars in old titles

* change theme Cayman blog?

* post exerpt in home

* site description has a visible <br> in it
