include .envrc

build:
	@go build -o bin/letsgoRestfull ./cmd/api
run: build
	@./bin/letsgoRestfull
test :
	@go test -v ./...

migrate:
	@echo 'Creating migration files for ${name}...'
	migrate create -seq -ext=.sql -dir=./migrations ${name}

up:
	@echo 'Running up migrations...'
	 migrate --path=./migrations -database ${GREENLIGHT_DB_DSN} up
