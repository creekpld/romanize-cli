
all: build

build:
	@swift build 

install:
	@cp .build/release/romanize-cli /usr/local/bin/romanize


clean:
	@swift package clean

xcode:
	@rm -rf romanize-cli.xcodeproj
	@swift package generate-xcodeproj

run: build
	@.build/debug/romanize-cli

release: clean
	@swift build --configuration release
	
