help: ## Show this help.
	@# Optionally add 'sort' before 'awk'
	@grep -E '^[a-zA-Z_%-]+\s*:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[0m %s\n", $$1, $$2}'
.PHONY: help

clean : ## Delete generated files and virtualenv
	rm -rf ${ve}
	rm -rf output
.PHONY: clean


syspython=python3.14
ve=.venv


## Dependencies (apt)

setup: ## Install required system packages using 'apt install'
	cat requirements.apt requirements-dev.apt | xargs sudo apt install -y --no-install-recommends
	@echo "You might want 'make bootstrap' next."
.PHONY: setup

${ve}: ## Create a virtualenv
	uv python pin ${syspython}
	uv venv

update: clean ${ve} ## Pip update packages, save versions to requirements.txt.
	uv pip install -U -r requirements.in
	uv pip freeze >requirements.txt
.PHONY: update

bootstrap: ${ve} ## Create venv & pip install packages from requirements.txt.
	uv pip sync requirements.txt
	@echo "You might want 'make serve' next."
.PHONY: bootstrap


## Build

post: ## Create a new post, prompts for title, opens $EDITOR
	uv run nikola new_post -f markdown -e
.PHONY: post

serve: ## Build site, start server, auto rebuild changes.
	uv run nikola auto
.PHONY: serve

deploy: ## Deploy site to Github
	uv run nikola github_deploy -m "Automatic commit"
.PHONY: deploy

