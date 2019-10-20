.PHONY: all format test clean build testdata

all: clean format test build testdata

format:
	go fmt ./...

test:
	go test ./...

target:
	mkdir target

clean:
	rm -rf target

build: target
	go build -o target/go-bindata ./go-bindata

testdata:
	$(MAKE) -C testdata
