TARGET = test

SOURCE_PREFIX = ./
SCHEME_OBJECTS = \
	$(SOURCE_PREFIX)a.o \
	$(SOURCE_PREFIX)make-b.o \
	$(SOURCE_PREFIX)b-foo.o \
	$(SOURCE_PREFIX)test.o

OBJECTS = \
	$(SCHEME_OBJECTS)

IMPORT_SOURCES = $(SCHEME_OBJECTS:.o=.import.scm)
LINK_FILES = $(SCHEME_OBJECTS:.o=.link)

COMPILE_FLAGS = \
	-J \
	-static

LINK_FLAGS = \
	-v \
	-static

$(TARGET): $(OBJECTS) $(IMPORT_SOURCES) $(LINK_FILES)
	csc $(LINK_FLAGS) -o $(TARGET) $(SCHEME_OBJECTS)

all: $(TARGET)

clean:
	rm -f $(OBJECTS) $(IMPORT_SOURCES) $(LINK_FILES) *.import.scm

fclean: clean
	rm -f $(TARGET)

re: fclean all

.PHONY: all clean fclean re

%.link %.import.scm %.o : %.scm
	csc $(COMPILE_FLAGS) -o $*.o -c $<

%.o: %.c
	csc $(COMPILE_FLAGS) -o $@ -c $<
