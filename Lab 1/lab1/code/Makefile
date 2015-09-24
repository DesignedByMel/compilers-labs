CPP = clang++
LEX = flex

CPPFLAGS  = -Wall
CPPFLAGS += $(FLAG)
LIB       = -ll
LEXFLAGS  =

TARGET   = scan
SRCDIR   = src
BUILDDIR = build

LEXFILE = $(SRCDIR)/xml.l
DRIVER  = $(SRCDIR)/driver.cpp
LEXO    = $(BUILDDIR)/lex.yy.c

$(TARGET): $(DRIVER) $(LEXO)
	$(CPP) $(CPPFLAGS) $^ $(LFLAGS) -o $@

$(LEXO): $(LEXFILE)
	mkdir -p $(BUILDDIR)
	$(LEX) -o $@ $(LEXFLAGS) $^

clean:
	rm -rf $(BUILDDIR) $(TARGET)

.PHONY: clean
