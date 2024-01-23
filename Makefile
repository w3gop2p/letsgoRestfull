include .envrc

build:
	@go build  -o bin/letsgoRestfull ./cmd/api
run: build
	@./bin/letsgoRestfull -db-dsn=${GREENLIGHT_DB_DSN} -jwt-secret=${JWT_SECRET}
test :
	@go test -v ./...

migrate:
	@echo 'Creating migration files for ${name}...'
	migrate create -seq -ext=.sql -dir=./migrations ${name}

up:
	@echo 'Running up migrations...'
	 migrate --path=./migrations -database ${GREENLIGHT_DB_DSN} up

run/api:
	@go run ./cmd/api -db-dsn=${GREENLIGHT_DB_DSN} -jwt-secret=${JWT_SECRET}