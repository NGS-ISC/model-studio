.PHONY: run build all


all: test

run: build

test: build build-test
	./model_studio

build: model_studio.vala
	valac -o model_studio $< --pkg=gtk+-3.0 --pkg=glib-2.0

build-test:
