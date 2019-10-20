.PHONY: all test clean build testdata

all: clean test build testdata

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
