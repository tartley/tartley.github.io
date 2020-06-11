help: ## Show this help.
	@# Optionally add 'sort' before 'awk'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'
.PHONY: help


## Virtualenv

name=tartley.com
syspython=python3.8
ve=${HOME}/.virtualenvs/${name}
pip=${ve}/bin/pip
nikola=${ve}/bin/nikola

clean: ## Delete virtualenv and built files.
	rm -rf ${ve}
	rm -rf output
.PHONY: clean

${ve}: ## Create a virtualenv
	${syspython} -m venv ${ve}
	${pip} install -U pip setuptools wheel

update: clean ${ve} ## Pip update packages, save versions to requirements.txt.
	${pip} install -U -r requirements.in
	${pip} freeze >requirements.txt
.PHONY: update

bootstrap: ${ve} ## Create venv & pip install packages from requirements.txt.
	${pip} install -r requirements.txt
.PHONY: bootstrap


## Build

new-post:
	${nikola} new_post -f markdown

.PHONY: new-post

serve:  ## Build site, start server, auto rebuild changes.
	${nikola} auto
.PHONY: serve

