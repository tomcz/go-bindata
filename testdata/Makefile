FILES:=$(wildcard out/*.go)

GOPATH := $(shell go env GOPATH)
GOLINT := ${GOPATH}/bin/golint
ERRCHECK := ${GOPATH}/bin/errcheck

.PHONY: check
check: ${ERRCHECK} ${GOLINT} $(FILES:.go=.checked)

out/%.checked: out/%.go
	${ERRCHECK} $<
	go vet $<
	${GOLINT} $<

.PHONY: build
build:
	rm -rf target
	mkdir target
	go build -o target/go-bindata ../go-bindata

out/compress-memcopy.go: $(wildcard in/**/*) build
	./target/go-bindata -o $@ in/...

out/compress-nomemcopy.go: $(wildcard in/**/*) build
	./target/go-bindata -nomemcopy -o $@ in/...

out/debug.go: $(wildcard in/**/*) build
	./target/go-bindata -debug -o $@ in/...

out/nocompress-memcopy.go: $(wildcard in/**/*) build
	./target/go-bindata -nocompress -o $@ in/...

out/nocompress-nomemcopy.go: $(wildcard in/**/*) build
	./target/go-bindata -nocompress -nomemcopy -o $@ in/...

${ERRCHECK}:
	go get -u github.com/kisielk/errcheck

${GOLINT}:
	go get -u golang.org/x/lint/golint
