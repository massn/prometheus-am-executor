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
	go build -o prometheus-am-executor

test: build
	go test
	./scripts/integration

all: test build
