export GO111MODULE=on

SOURCE_DIRS = circuits cmd hardhat utils

.PHONY: vendor clean build mod-clean

all: mod-clean vendor build

vendor:
	go mod vendor

clean:
	rm -rf build/

build:
	go build -o ./build/encryptedERC ./cmd/

mod-clean:
	go mod tidy
