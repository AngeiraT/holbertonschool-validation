build: ## Builds a website using hugo with current config in config.toml
	hugo

post: ## Creates a new post using env vars POST_TITLE and POST_NAME
	hugo new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

clean: ## Removes content from dist directory
	rm -rf dist/*

package: ## creating a zip line containing binary and the dist/ directory
	make build
	zip awesome-website.zip dist/index.html

unit-tests: ## testing various commands
	make package
	make clean

integration-tests: ## Stats server and checks local host URL
	hugo
	ls dist/
	
validate: ## Checks current working directory
	pwd

lint: ## lint markdown files 
	markdownlint README.md DEPLOY.md

.SILENT:
help: ## Displays helpful information for Makefile commands
	cat Makefile | grep '##' | tr -d '##'
