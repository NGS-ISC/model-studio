.PHONY: run build all

PACKAGES=--pkg=gtk+-3.0 --pkg=glib-2.0
ICCGUI=/home/eugeneai/Development/codes/NGS/model-studio/isu.gui.gtk/vala
FLAGS=-X $(ICCGUI)/icc_gui.so -X -I$(ICCGUI)

all: test

run: build

test: build build-test
	LD_LIBRARY_PATH=$(ICCGUI) ./model_studio

build: model_studio.vala
	valac -o model_studio $(ICCGUI)/icc_gui.vapi $< $(PACKAGES) $(FLAGS)

build-test:
