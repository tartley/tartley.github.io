# tartley.com Jekyll site

## Initial Jekyll site steup

Following instructions at:
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


