# Go-Hugo
## Prerequisites

- Install Hugo (the extended edition)
- Install Git
- install go

## Lifecycle
- lint: reads the source code. Must always be called before the goal build, to avoid compiling the code if the linter fails.
- build: Generate the website from the markdown and configuration files in the directory dist/. and compile the source code of the application to a binary named awesome-api.
- run: Run the application in background by executing the binary awesome-api, and write logs into a file named awesome.log.
- stop: Stop the application.
- clean: Cleanup the content of the directory dist and delete the binary awesome-api and the log file awesome-api.log.
- test: test to ensure application behaves as expected.
- post: Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME.
- help: prints out the list of commands in makefile and their usage.
- unit-tests: The goal unit-tests should be implemented and should execute (successfully) the Golang unit tests.
- integration-tests: should be implemented and should execute (successfully) the Golang integration tests.
