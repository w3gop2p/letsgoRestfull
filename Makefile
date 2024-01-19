build:
	@go build -o bin/letsgoRestfull ./cmd/api
run: build
	@./bin/letsgoRestfull
test :
	@go test -v ./...