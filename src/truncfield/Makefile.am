BUILT_SOURCES = main.c usage.c truncfield_main.h

$(BUILT_SOURCES) : args.tab
	"$(CGENER)" -a ./args.tab

bin_PROGRAMS = truncfield
truncfield_SOURCES = truncfield.c $(BUILT_SOURCES)
truncfield_LDADD = ../libcrush/libcrush.la

LOG_COMPILER = $(top_srcdir)/src/bin/testharness.sh
TESTS = test.conf

CLEANFILES = $(BUILT_SOURCES)

EXTRA_DIST = args.tab test.conf \
             test/test_01.sh test/test_02.sh test/test_03.sh

man1_MANS = truncfield.1
truncfield.1 : args.tab
	../bin/genman.pl args.tab > $@
