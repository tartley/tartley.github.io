help: ## Show this help.
	@# Optionally add 'sort' before 'awk'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'
.PHONY: help

clean: ## Delete generated files and virtualenv
	rm -rf ${ve}
	rm -rf output
.PHONY: clean


name=tartley.com
syspython=python3.8
ve=${HOME}/.virtualenvs/${name}


## Virtualenv

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
.PHONY: bootstrap


## Build

nikola=${ve}/bin/nikola

new-post:
	${nikola} new_post -f markdown
.PHONY: new-post

serve:  ## Build site, start server, auto rebuild changes.
	${nikola} auto
.PHONY: serve

deploy:
	${nikola} github_deploy -m "Automatic commit"
.PHONY: deploy

