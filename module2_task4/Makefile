# Implement the next steps for the actual Go-Hugo website's source code

build: check ##  Builds a website using gohugo on the dist folder ,if build fails ,check
		hugo --destination ./dist

post: ## Creates a new post using env vars POST_TITLE and POST_NAME
	hugo new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

clean: ##  Delete the binary awesome-api and the log file awesome-api.log
	rm -Rf dist

.SILENT:
help: ## Displays helpful information for Makefile commands
	echo "Usage: make <command>"
	echo "-----"	
	cat Makefile | grep '##' | tr -d '##'

check:  ## Lints and check for dead links on markdowns using markdownlint-cli and markdown-link-check
	markdownlint ./content/posts/*.md
	markdown-link-check ./content/posts/*.md

validate: ## Validates dist/index.html using W3C Hbtn validator
	make build
	-git clone https://github.com/holbertonschool/W3C-Validator.git
	-./W3C-Validator/w3c_validator.py ./dist/index.html
	-rm -rf ./W3C-Validator
