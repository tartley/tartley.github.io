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

