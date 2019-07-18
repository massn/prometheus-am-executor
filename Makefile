ifndef TMPDIR
export TMPDIR := /tmp
endif

.PHONY = test deps env build all

env:
	go get github.com/juju/testing/checkers

deps: env
	go env GOPATH
	go get

build: deps
	GOOS=linux GOARCH=amd64 go build -o test-prometheus-am-executor

test: build
	go test
	./scripts/integration

all: test build
