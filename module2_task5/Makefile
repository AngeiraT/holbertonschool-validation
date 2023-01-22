# Implement the next steps for the actual Go-Hugo website's source code
go-build:	## Builds the API binary file using go
	go mod init github.com/Apinedas/awesome-api
	go get github.com/gorilla/mux
	go build

hugo-build: check		## Builds a website using gohugo on the dist folder
	hugo --destination ./dist

build:	## Builds all that is needed for website
	make go-build
	make hugo-build

post: ## Creates a new post using env vars POST_TITLE and POST_NAME
	hugo new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

clean: ##  Delete the binary awesome-api and the log file awesome-api.log
	-make stop
	-rm ./awesome-api awesome.log coverage* go* ./dist

.SILENT:
help: ## Displays helpful information for Makefile commands
	echo "Usage: make <command>"
	echo "-----"	
	cat Makefile | grep '##' | tr -d '##'
 
run: ## Run the application in background by executing the binary awesome-api, and write logs
	./awesome-api >./awesome.log 2>&1 &

stop: ## Stop the application with the command kill
	pkill awesome-api

test: ## You want to test it to ensure that it behaves as expected.
	-make build
	make unit-tests
	make integration-tests

lint: ## the linter reads the source code and detect common semantic errors.
	golangci-lint run ./main.go

unit-tests: ##execute (successfully) the Golang unit tests
	go test -v -short -coverprofile=coverage-units.out

integration-tests: ##  execute (successfully) the Golang integration tests
	go test -v -coverprofile=coverage-integrations.out

check:  ## Lints and check for dead links on markdowns using markdownlint-cli and markdown-link-check
	markdownlint ./content/posts/*.md
	markdown-link-check ./content/posts/*.md

validate: ## Validates dist/index.html using W3C Hbtn validator
	make build
	-git clone https://github.com/holbertonschool/W3C-Validator.git
	-./W3C-Validator/w3c_validator.py ./dist/index.html
	-rm -rf ./W3C-Validator
