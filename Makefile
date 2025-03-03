help: ## Show this help.
	@# Optionally add 'sort' before 'awk'
	@grep -E '^[a-zA-Z_%-]+\s*:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'
.PHONY: help

clean : ## Delete generated files and virtualenv
	rm -rf ${ve}
	rm -rf output
.PHONY: clean


name=tartley.com
syspython=python3.13
ve=${HOME}/.virtualenvs/${name}


## Dependencies (apt)

setup: ## Install required system packages using 'apt install'
	cat requirements.apt requirements-dev.apt | xargs sudo apt install -y --no-install-recommends
	@echo "You might want 'make bootstrap' next."
.PHONY: setup

## Dependencies (pip)
# TODO consider how to split requirements[-dev] from .in and .txt

pip=${ve}/bin/pip

${ve}: ## Create a virtualenv
	${syspython} -m venv ${ve}
	${pip} install -U pip setuptools wheel

update: clean ${ve} ## Pip update packages, save versions to requirements.txt.
	${pip} install -U -r requirements.in
	${pip} freeze >requirements.txt
.PHONY: update

bootstrap: ${ve} ## Create venv & pip install packages from requirements.txt.
	${pip} install -r requirements.txt
	@echo "You might want 'make serve' next."
.PHONY: bootstrap


## Build

nikola=${ve}/bin/nikola

post: ## Create a new post, prompts for title, opens $EDITOR
	${nikola} new_post -f markdown -e
.PHONY: post

serve: ## Build site, start server, auto rebuild changes.
	${nikola} auto
.PHONY: serve

deploy: ## Deploy site to Github
	. ${ve}/bin/activate && \
	${nikola} github_deploy -m "Automatic commit"
.PHONY: deploy

