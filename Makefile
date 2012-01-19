# Luabash Makefile

# EDITABLE VARS
CC=gcc
SDIR=src/
ODIR=build/
CFLAGS=-shared -fPIC -Wall
# END

# Get targets and objects
TARGETS := $(wildcard  $(SDIR)*.c)
OBJECTS := $(patsubst $(SDIR)%.c, $(ODIR)%.so, $(TARGETS))

build: $(TARGETS)
	@echo Making build dir
	@mkdir -p $(ODIR)
	$(CC) -o $(OBJECTS) $(TARGETS) $(CFLAGS)	


.PHONY:  clean
clean: 
	@rm -rf $(ODIR)
	@echo Done
