FILES:=$(wildcard out/*.go)

GOPATH := $(shell go env GOPATH)
GOLINT := ${GOPATH}/bin/golint
ERRCHECK := ${GOPATH}/bin/errcheck
GOBINDATA := ../target/go-bindata

.PHONY: check
check: ${ERRCHECK} ${GOLINT} $(FILES:.go=.checked)

out/%.checked: out/%.go
	${ERRCHECK} $<
	go vet $<
	${GOLINT} $<

out/compress-memcopy.go: $(wildcard in/**/*) ${GOBINDATA}
	${GOBINDATA} -o $@ in/...

out/compress-nomemcopy.go: $(wildcard in/**/*) ${GOBINDATA}
	${GOBINDATA} -nomemcopy -o $@ in/...

out/debug.go: $(wildcard in/**/*) ${GOBINDATA}
	${GOBINDATA} -debug -o $@ in/...

out/nocompress-memcopy.go: $(wildcard in/**/*) ${GOBINDATA}
	${GOBINDATA} -nocompress -o $@ in/...

out/nocompress-nomemcopy.go: $(wildcard in/**/*) ${GOBINDATA}
	${GOBINDATA} -nocompress -nomemcopy -o $@ in/...

${ERRCHECK}:
	go get -u github.com/kisielk/errcheck

${GOLINT}:
	go get -u golang.org/x/lint/golint
