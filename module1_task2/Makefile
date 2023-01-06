build: ## Builds a website using hugo with current config in config.toml
	hugo

post: ## Creates a new post using env vars POST_TITLE and POST_NAME
	hugo new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

clean: ## Removes content from dist directory
	rm -rf dist/*

.SILENT:
help: ## Displays helpful information for Makefile commands
	cat Makefile | grep '##' | tr -d '##'
