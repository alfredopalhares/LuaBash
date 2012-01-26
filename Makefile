# Luabash Makefile

# EDITABLE VARS
CC=gcc
SDIR=src
ODIR=build
DDIR=doc
CFLAGS=-llua -shared -fPIC -Wall
preffix=/usr/share
# END

# Get targets and objects
TARGETS := $(wildcard  $(SDIR)/*.c)
OBJECTS := $(patsubst $(SDIR)%.c, $(ODIR)%.so, $(TARGETS))

build: $(TARGETS)
	@echo Making build dir
	@mkdir -p $(ODIR)
	$(CC) -o $(OBJECTS) $(TARGETS) $(CFLAGS)	

.PHONY:  clean
clean: 
	@rm -rf $(ODIR)
	@echo Done

install: 
	@echo Installing the library..
	install -Dm 644 $(ODIR)/luabash.so $(DESTDIR)$(preffix)/luabash/luabash.so
	@echo Installing the documentation...
	install -Dm 644 README.md $(DESTDIR)$(preffix)/doc/luabash/README.md
	install -Dm 644 $(DDIR)/example.sh  $(DESTDIR)$(preffix)/doc/luabash/doc/example.sh
	install -Dm 644 $(DDIR)/internal.lua  $(DESTDIR)$(preffix)/doc/luabash/doc/internal.lua

