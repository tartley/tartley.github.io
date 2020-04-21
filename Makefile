help: ## Show this help
	@# Optionally add 'sort' before 'awk'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'
.PHONY: help

# This required so that containers, if we are in one,
# don't share gems with the host, which may be on a different OS revision,
# with different shared libraries available, etc.
export GEM_HOME = /home/jhartley/.gems.tartley.com
export PATH := $(GEM_HOME)/bin:$(PATH)

bootstrap: ## Install dependencies ubuntu 18.04
	mkdir -p $$GEM_HOME/bin
	sudo apt install -y make build-essential ruby ruby-dev zlib1g-dev
	# old: liblzma-dev patch ruby-bundler
	gem install bundler -v 1.17.3
	bundle install
.PHONY: bootstrap

test: ## test env vars are set
	ls -l $$GEM_HOME

update: ## Update dependencies
	bundle update
.PHONY: update

serve: ## Serve website local preview
	# -H so we can serve from a container and be seen on the host.
	bundle exec jekyll serve --incremental -H 0.0.0.0
.PHONY: serve

post: ## Create an empty new post
	@echo "Run \"./newpost <slug>\""
.PHONY: post

