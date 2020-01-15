# Documenation

See Makefile, & 'newpost' script.

# TODO

* favicon?

* comments - display existing.
* links to #comments exist
* suggest a place to leave new comments? In the post template?

* syntax highlighting in solarized

* Embed ancient backed up tartley.com content, and link to it.

## Theme changes

* choosing another theme that provides the following.
  Otherwise, will need to fork the current theme. :-/

* TOC show post date *after* title instead of before

* TOC: show post categories
* click on a category to show all posts in that category.
* show post categories in post

* RSS feed?
* Category based RSS feeds? (esp 'python')

# Done ########################################################################

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

* images

* delete all the thumbnail images before committing?

* tartley.github.io fwds to tartley.com, how do I make it stop
* tartley.github.io/POST gives a 404. What is the proper form of POST?
    - magically fixed themselves. Presumably adding the root url config
      to the github project affects some dns or other forwarding mechanism
      at github.io, and changes to this took a while (days!) to propagate.

* **by ...**

* I&#8217;d
* â€™ -> '
* â€ -> "
* â€œ -> " ???
* Ã© -> é
* Ã« -> ë

* syntax highlighting: fix language markup
    ``` {lang="X"}
    is there rouge support for DOS/CMD ?
    check 'bash' instances to see if they should be 'shell_command' or whatever it is
    ``` {other...}
    bare ```
    plain indented

*   

Using a CNAME to point tartley.com -> anything else will break email.
Because CNAME makes one domain inherit all DNS records from another,
including MX (email) records.

Using a HTTP redirect will display the github.io url in the browser

Solution is to use github.io custom domains. Go read...

* email: figure out how to handle it when webfaction no longer hosts my domain
  name.com has some "email forwarding" service, can I use that?

* html entities in post titles
    * on index
    * in posts?

name.com domain name provider
name.com email hosting
name.com nameservers
name.com dns records:
    ANAME     tartley.com -> tartley.github.io
    CNAME www.tartley.com -> tartley.github.io

tartley.github.io configured with subdomain www.tartley.com
github will forward from tartley.com -> www.tartley.com

tartley.com ANAME record
    A record must point at IP address, which may vary
    ALIAS not supported by name.com I think
    Done
    When DNS propagated, these should give same IP:
        dig tartley.com +noall +answer
        dig tartley.github.io +noall +answer

www.tartley.com -> tartley.github.io
    subdomains are configured with a DNS 'CNAME' record
    Done. When propagated, see:
        dig www.example.com +nostats +nocomments +nocmd
    Should look like example at:
    https://help.github.com/articles/setting-up-a-www-subdomain/

* test incoming emails work

* https:
  letsencrypt:
    all handled automatically, thanks github!
  * await cert gen

enforce https: ie. http://tartley.com fwds to https://www.tartley.com
  * await DNS prop

* Can we preserve old post urls?
  Post prefix data includes wordpress id
    but no, because my old URLs used a GET param,
    and my new site is static, so cannot dynamically do anything in reaction
    to parameters.

* about

Secondary sites:
* email webfaction: files in their latest warning have not changed since 2008
  Is this likely to be a false positive?
* contact secondary site owners, telling them what's going on
* delete 'infected files' ?
* export secondary site contents
* Drop webfaction?

* links between posts should be relative
  so they work in dev and prod.
* search for remaining references to 'tartley.com/...'

* Why is there a README, Makefile, etc in site directory?
  looks like they are copied from root on site serving
  or generation. :-/

