SHEDSKIN_LIBDIR=/usr/share/shedskin/lib
CC=g++
CCFLAGS=-O2 -march=native -Wno-deprecated $(CPPFLAGS) -I. -I${SHEDSKIN_LIBDIR}
LFLAGS=-lgc -lpcre $(LDFLAGS) -lutil

CPPFILES=/home/frankie/Dropbox/Python_Projects/FindPatternInFile/findinfile.cpp \
	${SHEDSKIN_LIBDIR}/sys.cpp \
	${SHEDSKIN_LIBDIR}/stat.cpp \
	${SHEDSKIN_LIBDIR}/re.cpp \
	${SHEDSKIN_LIBDIR}/os/path.cpp \
	${SHEDSKIN_LIBDIR}/os/__init__.cpp \
	${SHEDSKIN_LIBDIR}/builtin.cpp

HPPFILES=/home/frankie/Dropbox/Python_Projects/FindPatternInFile/findinfile.hpp \
	${SHEDSKIN_LIBDIR}/sys.hpp \
	${SHEDSKIN_LIBDIR}/stat.hpp \
	${SHEDSKIN_LIBDIR}/re.hpp \
	${SHEDSKIN_LIBDIR}/os/path.hpp \
	${SHEDSKIN_LIBDIR}/os/__init__.hpp \
	${SHEDSKIN_LIBDIR}/builtin.hpp

all:	findinfile

findinfile:	$(CPPFILES) $(HPPFILES)
	$(CC)  $(CCFLAGS) $(CPPFILES) $(LFLAGS) -o findinfile

findinfile_prof:	$(CPPFILES) $(HPPFILES)
	$(CC) -pg -ggdb $(CCFLAGS) $(CPPFILES) $(LFLAGS) -o findinfile_prof

findinfile_debug:	$(CPPFILES) $(HPPFILES)
	$(CC) -g -ggdb $(CCFLAGS) $(CPPFILES) $(LFLAGS) -o findinfile_debug

clean:
	rm -f findinfile findinfile_prof findinfile_debug

.PHONY: all clean

