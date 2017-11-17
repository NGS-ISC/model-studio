.PHONY: run build all

ICCGUI=/home/eugeneai/Development/codes/NGS/model-studio/isu.gui.gtk/vala
GRCDIR=/home/eugeneai/Development/codes/NGS/model-studio/isu.gui.gtk/vala

PACKAGES=--pkg=gtk+-3.0 --pkg=glib-2.0
RES=resources.o
GRES=model_studio.gresource.xml
SRC=model_studio.vala
OBJS=model_studio.o $(RES)

RSFLAGS= --gresources=$(GRES) --gresourcesdir=$(GRCDIR)
FLAGS=-X $(ICCGUI)/icc_gui.so -X -I$(ICCGUI) -g

all: build-c test

run: build

test: build build-test
	LD_LIBRARY_PATH=$(ICCGUI) ./model_studio

build-direct: $(SRC)
	valac -o model_studio $(ICCGUI)/icc_gui.vapi $< $(PACKAGES) $(FLAGS) $(RSFLAGS)

build-test:

build: model_studio

model_studio.c: $(SRC)
	valac -C $(ICCGUI)/icc_gui.vapi $< $(PACKAGES) $(RSFLAGS)

resources.c: $(GRES)
	glib-compile-resources $< --target=$@ --generate-source
all: demo

clean:
	rm -fv *~ *.o model_studio

#my-resources.c: my-resources.xml mywidget.ui
#	glib-compile-resources my-resources.xml \
#		--target=$@ --sourcedir=$(srcdir) --c-name _my --generate-source

%.o:%.c
	gcc -o $@ -c $< -Wall `pkg-config --cflags gtk+-3.0 gmodule-export-2.0`

model_studio: $(OBJS)
	gcc -o $@  $^ `pkg-config --libs gtk+-3.0 gmodule-export-2.0`
