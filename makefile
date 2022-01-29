.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

all: install

install: zshrc tmux.conf ## Install files
	@cp zshrc ~/.zshrc
	@cp tmux.conf ~/.tmux.conf
