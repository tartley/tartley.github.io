bootstrap:
	sudo apt install -y build-essential liblzma-dev patch ruby ruby-bundler ruby-dev zlib1g-dev
	bundle install

update:
	bundle update

serve:
	JEKYLL_GITHUB_TOKEN=d2ec6ae059dae3451384158139a5d8b9c5b0458a bundle exec jekyll serve --incremental

post:
	@echo "Run \"./newpost <slug>\""

