.PHONY: run build all

PACKAGES=--pkg=gtk+-3.0 --pkg=glib-2.0
ICCGUI=/home/eugeneai/Development/codes/NGS/model-studio/isu.gui.gtk/vala
FLAGS=-X $(ICCGUI)/icc_gui.so -X -I$(ICCGUI) -g  --gresources ../ui/model_studio.gresource.xml --gresourcesdir ../ui
SRC=model_studio.vala resources.c

all: build-c test

run: build

test: build build-test
	LD_LIBRARY_PATH=$(ICCGUI) ./model_studio

build: $(SRC)
	valac -o model_studio $(ICCGUI)/icc_gui.vapi $< $(PACKAGES) $(FLAGS)

build-test:

build-c: $(SRC)
	valac -C $(ICCGUI)/icc_gui.vapi $< $(PACKAGES)

resources.c: ../ui/model_studio.gresource.xml
	glib-compile-resources $< --target=$@ --generate-source
