C      = gcc
DEBUG   = -g
CFLAGS  = -Wall -std=c11 -pedantic
BIN     = osp_demo
SOURCES = $(wildcard *.c)
OBJECTS = $(patsubst %.c, %.o, $(wildcard *.c))
HEADERS = $(wildcard *.h)

# Prevent make to do some strange behaviour,
#   e.g. if a file called "all" or "debug" exists in the source path, it won't work as expected.
.PHONY: all debug clean

# Prevent make deleting file when it is interrupted
.PRECIOUS: $(BIN) $(OBJECTS)


%.o: %.c %.h
	@echo Compiling $@ ...
	$(CC) $(CFLAGS) -c $< -o $@

all: $(OBJECTS)
	@echo Linking...
	$(CC) $(CFLAGS) -o $(BIN) $(OBJECTS)

debug:  $(OBJECTS)
	@echo Linking...
	$(CC) $(CFLAGS) $(DEBUG) -o $(BIN) $(OBJECTS)

clean:
	rm -f $(OBJECTS) $(BIN)

