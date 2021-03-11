.DEFAULT_GOAL := build

V = v
LFLAGS = -shared -prod

build:
	$(V) $(LFLAGS) vtpcache.v
