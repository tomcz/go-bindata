all: test testdata

test:
	go test ./...

.PHONY: testdata
testdata:
	$(MAKE) -C testdata
