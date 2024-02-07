prefix ?= /usr/local
bindir = $(prefix)/bin

build:
	swiftc betterdisplaycli.swift

install: build
	install -d "$(bindir)"
	install "./betterdisplaycli" "$(bindir)"

uninstall:
	rm -rf "$(bindir)/betterdisplaycli"

clean:
	rm -rf betterdisplaycli

.PHONY: build install uninstall clean