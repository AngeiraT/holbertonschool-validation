# Implement the next steps for the actual Go-Hugo website's source code

build: ## Compile the source code of the application to a binary name file using tje command go build
	hugo
	make lint
	go build

post: ## Creates a new post using env vars POST_TITLE and POST_NAME
	hugo new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

clean: ##  Delete the binary awesome-api and the log file awesome-api.log
	-make stop
	-rm ./awesome-api awesome.log coverage*

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
	make unit-tests
	make integration-tests

lint: ## the linter reads the source code and detect common semantic errors.
	golangci-lint run ./main.go

unit-tests: ##execute (successfully) the Golang unit tests
	go test -v -short -coverprofile=coverage-units.out

integration-tests: ##  execute (successfully) the Golang integration tests
	go test -v -coverprofile=coverage-integrations.out
