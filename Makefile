bootstrap:
	sudo apt install -y build-essential liblzma-dev patch ruby ruby-bundler ruby-dev zlib1g-dev
	bundle install

serve:
	bundle exec jekyll serve --incremental

post:
	@echo "Run \"./newpost <slug>\""

