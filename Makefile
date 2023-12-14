#!/bin/sh

.PHONY: build
build:
	flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: setup
setup:
	flutter clean
	flutter pub get

.PHONY: commitreset
commitreset:
	git reset --soft HEAD^