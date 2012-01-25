# Luabash Makefile

# EDITABLE VARS
CC=gcc
SDIR=src
ODIR=build
DDIR=doc
CFLAGS=-shared -fPIC -Wall
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
	install -Dm 644 $(ODIR)/luabash.so /usr/share/luabash/luabash.so
	@echo Installing the documentation...
	install -Dm 644 README.md /usr/share/doc/luabash/README.md
	install -Dm 644 $(DDIR)/example.sh  /usr/share/doc/luabash/doc/example.sh
	install -Dm 644 $(DDIR)/internal.lua  /usr/share/doc/luabash/doc/internal.lua

