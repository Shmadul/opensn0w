#
#  Copyright (c) 2007, 2008, 2009, 2010, 2011
#  Jonathan Schleifer <js@webkeks.org>
#  https://webkeks.org/hg/buildsys/
#
#  Copyright (c) 2017
#  Mason Dulemba (@shmadul)
#
#  Permission to use, copy, modify, and/or distribute this software for any
#  purpose with or without fee is hereby granted, provided that the above
#  copyright notice and this permission notice is present in all copies.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
#  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
#  LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
#  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
#  SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
#  INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
#  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
#  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
#  POSSIBILITY OF SUCH DAMAGE.
#

PACKAGE = opensn0w
AS = @AS@
CC = clang -std=gnu99
CXX = @CXX@
CPP = clang -E
DC = @DC@
ERLC = @ERLC@
OBJC = @OBJC@
OBJCXX = @OBJCXX@
AR = /opt/local/bin/ar
LD = ${CC}
RANLIB = /opt/local/bin/ranlib
PYTHON = @PYTHON@
ASFLAGS = @ASFLAGS@
CFLAGS = -g -O2
CXXFLAGS = @CXXFLAGS@
CPPFLAGS = -g -O2  -std=gnu99 -Werror-implicit-function-declaration  -DPREFIX=\"${prefix}\" -DLOCALEDIR=\"${LOCALEDIR}\" -DMODDIR=\"${MODDIR}\" -DSHAREDIR=\"${prefix}\" -DSYSCONFDIR=\"${prefix}/etc\" -DLOGDIR=\"${prefix}/var\" -DRUNDIR=\"${prefix}/var\" -DDATADIR=\"${prefix}/etc\"
DFLAGS = @DFLAGS@
ERLCFLAGS = @ERLCFLAGS@
OBJCFLAGS = @OBJCFLAGS@
OBJCXXFLAGS = @OBJCXXFLAGS@
LDFLAGS = 
LDFLAGS_RPATH = -Wl,-rpath,${libdir}
LIBS = -lssl -lcrypto -lcurl -lreadline -lusb-1.0 -lpthread -ldl -lz  /Users/shmadul/opensn0w//prebuilt/libusb-1.0.a -framework IOKit -framework CoreFoundation 
PYTHON_FLAGS = @PYTHON_FLAGS@
PROG_IMPLIB_NEEDED = no
PROG_IMPLIB_LDFLAGS = 
PROG_SUFFIX = 
LIB_CFLAGS = -fPIC
LIB_LDFLAGS = -compatibility_version ${LIB_MAJOR}.${LIB_MINOR} -current_version ${LIB_MAJOR}.${LIB_MINOR} -install_name ${libdir}/${LIB} -dynamiclib -flat_namespace
LIB_PREFIX = lib
LIB_SUFFIX = .dylib
PLUGIN_CFLAGS = -fPIC
PLUGIN_LDFLAGS = -bundle -flat_namespace -undefined suppress
PLUGIN_SUFFIX = .impl
INSTALL_LIB = ${INSTALL} -m 755 $$i ${DESTDIR}${libdir}/$${i%.dylib}.${LIB_MAJOR}.${LIB_MINOR}.dylib && ${LN_S} -f $${i%.dylib}.${LIB_MAJOR}.${LIB_MINOR}.dylib ${DESTDIR}${libdir}/$${i%.dylib}.${LIB_MAJOR}.dylib && ${LN_S} -f $${i%.dylib}.${LIB_MAJOR}.${LIB_MINOR}.dylib ${DESTDIR}${libdir}/$$i
UNINSTALL_LIB = rm -f ${DESTDIR}${libdir}/$$i ${DESTDIR}${libdir}/$${i%.dylib}.${LIB_MAJOR}.dylib ${DESTDIR}${libdir}/$${i%.dylib}.${LIB_MAJOR}.${LIB_MINOR}.dylib
CLEAN_LIB = 
LN_S = ln -s
MKDIR_P = mkdir -p
INSTALL = /usr/local/bin/ginstall -c
SHELL = /bin/sh
MSGFMT = @MSGFMT@
JAVAC = @JAVAC@
JAVACFLAGS = @JAVACFLAGS@
JAR = @JAR@
WINDRES = @WINDRES@
prefix = /opensn0w
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
libdir = ${exec_prefix}/lib
plugindir ?= ${libdir}/${PACKAGE}
datarootdir = ${prefix}/share
datadir = ${datarootdir}
includedir = ${prefix}/include
includesubdir ?= ${PACKAGE}
localedir = ${datarootdir}/locale
localename ?= ${PACKAGE}
mandir = ${datarootdir}/man
mansubdir ?= man1

OBJS1 = ${SRCS:.c=.o}
OBJS2 = ${OBJS1:.cc=.o}
OBJS3 = ${OBJS2:.cxx=.o}
OBJS4 = ${OBJS3:.d=.o}
OBJS5 = ${OBJS4:.erl=.beam}
OBJS6 = ${OBJS5:.java=.class}
OBJS7 = ${OBJS6:.m=.o}
OBJS8 = ${OBJS7:.mm=.o}
OBJS9 = ${OBJS8:.py=.pyc}
OBJS10 = ${OBJS9:.rc=.o}
OBJS11 = ${OBJS10:.S=.o}
OBJS += ${OBJS11:.xpm=.o}

LIB_OBJS = ${OBJS:.o=.lib.o}
PLUGIN_OBJS = ${OBJS:.o=.plugin.o}

MO_FILES = ${LOCALES:.po=.mo}

.SILENT:
.SUFFIXES:
.SUFFIXES: .beam .c .c.dep .cc .cc.dep .class .cxx .cxx.dep .d .erl .lib.o .java .mo .m .m.dep .mm .mm.dep .o .plugin.o .po .py .pyc .rc .S .S.dep .xpm
.PHONY: all subdirs pre-depend depend install install-extra uninstall uninstall-extra clean distclean locales

all:
	${MAKE} ${MFLAGS} subdirs
	${MAKE} ${MFLAGS} depend
	${MAKE} ${STATIC_LIB} ${STATIC_LIB_NOINST} ${STATIC_PIC_LIB} ${STATIC_PIC_LIB_NOINST} ${SHARED_LIB} ${SHARED_LIB_NOINST} ${PLUGIN} ${PLUGIN_NOINST} ${PROG} ${PROG_NOINST} ${JARFILE} locales

subdirs:
	for i in ${SUBDIRS}; do \
		${DIR_ENTER}; \
		${MAKE} ${MFLAGS} || exit $$?; \
		${DIR_LEAVE}; \
	done

depend: pre-depend ${SRCS}
	regen=0; \
	deps=""; \
	test -f .deps || regen=1; \
	for i in ${SRCS}; do \
		case $$i in \
			*.c | *.cc | *.cxx | *.m | *.mm | *.S) \
				test $$i -nt .deps && regen=1; \
				deps="$$deps $$i.dep"; \
				;; \
		esac; \
	done; \
	if test x"$$regen" = x"1" -a x"$$deps" != x""; then \
		${DEPEND_STATUS}; \
		if ${MAKE} ${MFLAGS} $$deps && cat $$deps >.deps; then \
			rm -f $$deps; \
			${DEPEND_OK}; \
		else \
			:> .deps; \
			touch -t 0001010000 .deps; \
			${DEPEND_FAILED}; \
		fi; \
	fi

.c.c.dep .cc.cc.dep .cxx.cxx.dep .m.m.dep .mm.mm.dep .S.S.dep:
	${CPP} ${CPPFLAGS} -M $< | \
	sed 's/^\([^\.]*\)\.o:/\1.o \1.lib.o \1.plugin.o:/' >$@ || \
	{ rm -f $@; false; }

pre-depend:

${PROG} ${PROG_NOINST}: ${EXT_DEPS} ${OBJS}
	${LINK_STATUS}
	if ${LD} -o $@ ${OBJS} ${LDFLAGS} ${LIBS}; then \
		${LINK_OK}; \
	else \
		${LINK_FAILED}; \
	fi

${JARFILE}: ${EXT_DEPS} ${JAR_MANIFEST} ${OBJS}
	${LINK_STATUS}
	if test x"${JAR_MANIFEST}" != x""; then \
		if ${JAR} cfm ${JARFILE} ${JAR_MANIFEST} ${OBJS}; then \
			${LINK_OK}; \
		else \
			${LINK_FAILED}; \
		fi \
	else \
		if ${JAR} cf ${JARFILE} ${OBJS}; then \
			${LINK_OK}; \
		else \
			${LINK_FAILED}; \
		fi \
	fi

${SHARED_LIB} ${SHARED_LIB_NOINST}: ${EXT_DEPS} ${LIB_OBJS}
	${LINK_STATUS}
	rm -f $@
	objs=""; \
	ars=""; \
	for i in ${LIB_OBJS}; do \
		case $$i in \
			*.a) \
				ars="$$ars $$i" \
				;; \
			*.o) \
				objs="$$objs $$i" \
				;; \
		esac \
	done; \
	for i in $$ars; do \
		dir=".$$(echo $$i | sed 's/\//_/g').objs"; \
		rm -fr $$dir; \
		mkdir -p $$dir; \
		cd $$dir; \
		ar x ../$$i; \
		for j in *.o; do \
			objs="$$objs $$dir/$$j"; \
		done; \
		cd ..; \
	done; \
	if ${LD} -o $@ $$objs ${LIB_LDFLAGS} ${LDFLAGS} ${LIBS}; then \
		${LINK_OK}; \
	else \
		${LINK_FAILED}; \
		rm -f $@; \
	fi; \
	for i in $$ars; do \
		dir=".$$(echo $$i | sed 's/\//_/g').objs"; \
		rm -fr $$dir; \
	done

${PLUGIN} ${PLUGIN_NOINST}: ${EXT_DEPS} ${PLUGIN_OBJS}
	${LINK_STATUS}
	if ${LD} -o $@ ${PLUGIN_OBJS} ${PLUGIN_LDFLAGS} ${LDFLAGS} ${LIBS}; then \
		${LINK_OK}; \
	else \
		${LINK_FAILED}; \
	fi

${STATIC_LIB} ${STATIC_LIB_NOINST}: ${EXT_DEPS} ${OBJS}
	${LINK_STATUS}
	rm -f $@
	objs=""; \
	ars=""; \
	for i in ${OBJS}; do \
		case $$i in \
			*.a) \
				ars="$$ars $$i" \
				;; \
			*.o) \
				objs="$$objs $$i" \
				;; \
		esac \
	done; \
	for i in $$ars; do \
		dir=".$$(echo $$i | sed 's/\//_/g').objs"; \
		rm -fr $$dir; \
		mkdir -p $$dir; \
		cd $$dir; \
		ar x ../$$i; \
		for j in *.o; do \
			objs="$$objs $$dir/$$j"; \
		done; \
		cd ..; \
	done; \
	if ${AR} cr $@ $$objs && ${RANLIB} $@; then \
		${LINK_OK}; \
	else \
		${LINK_FAILED}; \
		rm -f $@; \
	fi; \
	for i in $$ars; do \
		dir=".$$(echo $$i | sed 's/\//_/g').objs"; \
		rm -fr $$dir; \
	done

${STATIC_PIC_LIB} ${STATIC_PIC_LIB_NOINST}: ${EXT_DEPS} ${LIB_OBJS}
	${LINK_STATUS}
	rm -f $@
	if ${AR} cr $@ ${LIB_OBJS} && ${RANLIB} $@; then \
		${LINK_OK}; \
	else \
		${LINK_FAILED}; \
		rm -f $@; \
	fi

locales: ${MO_FILES}

.c.o:
	${COMPILE_STATUS}
	if ${CC} ${CFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_OK}; \
	else \
		${COMPILE_FAILED}; \
	fi
.c.lib.o:
	${COMPILE_LIB_STATUS}
	if ${CC} ${LIB_CFLAGS} ${CFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_LIB_OK}; \
	else \
		${COMPILE_LIB_FAILED}; \
	fi
.c.plugin.o:
	${COMPILE_PLUGIN_STATUS}
	if ${CC} ${PLUGIN_CFLAGS} ${CFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_PLUGIN_OK}; \
	else \
		${COMPILE_PLUGIN_FAILED}; \
	fi

.cc.o .cxx.o:
	${COMPILE_STATUS}
	if ${CXX} ${CXXFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_OK}; \
	else \
		${COMPILE_FAILED}; \
	fi
.cc.lib.o .cxx.lib.o:
	${COMPILE_LIB_STATUS}
	if ${CXX} ${LIB_CFLAGS} ${CXXFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_LIB_OK}; \
	else \
		${COMPILE_LIB_FAILED}; \
	fi
.cc.plugin.o .cxx.plugin.o:
	${COMPILE_PLUGIN_STATUS}
	if ${CXX} ${PLUGIN_CFLAGS} ${CXXFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_PLUGIN_OK}; \
	else \
		${COMPILE_PLUGIN_FAILED}; \
	fi

.d.o:
	${COMPILE_STATUS}
	if test x"$(basename ${DC})" = x"dmd"; then \
		if ${DC} ${DFLAGS} -c -of$@ $<; then \
			${COMPILE_OK}; \
		else \
			${COMPILE_FAILED}; \
		fi \
	else \
		if ${DC} ${DFLAGS} -c -o $@ $<; then \
			${COMPILE_OK}; \
		else \
			${COMPILE_FAILED}; \
		fi \
	fi

.erl.beam:
	${COMPILE_STATUS}
	if ${ERLC} ${ERLCFLAGS} -o $@ $<; then \
		${COMPILE_OK}; \
	else \
		${COMPILE_FAILED}; \
	fi

.java.class:
	${COMPILE_STATUS}
	if ${JAVAC} ${JAVACFLAGS} $<; then \
		${COMPILE_OK}; \
	else \
		${COMPILE_FAILED}; \
	fi

.m.o:
	${COMPILE_STATUS}
	if ${OBJC} ${OBJCFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_OK}; \
	else \
		${COMPILE_FAILED}; \
	fi
.m.lib.o:
	${COMPILE_LIB_STATUS}
	if ${OBJC} ${LIB_CFLAGS} ${OBJCFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_LIB_OK}; \
	else \
		${COMPILE_LIB_FAILED}; \
	fi
.m.plugin.o:
	${COMPILE_PLUGIN_STATUS}
	if ${OBJC} ${PLUGIN_CFLAGS} ${OBJCFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_PLUGIN_OK}; \
	else \
		${COMPILE_PLUGIN_FAILED}; \
	fi

.mm.o:
	${COMPILE_STATUS}
	if ${OBJCXX} ${OBJCXXFLAGS} ${OBJCFLAGS} ${CXXFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_OK}; \
	else \
		${COMPILE_FAILED}; \
	fi
.mm.lib.o:
	${COMPILE_LIB_STATUS}
	if ${OBJCXX} ${LIB_CFLAGS} ${OBJCXXFLAGS} ${OBJCFLAGS} ${CXXFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_LIB_OK}; \
	else \
		${COMPILE_LIB_FAILED}; \
	fi
.mm.plugin.o:
	${COMPILE_PLUGIN_STATUS}
	if ${OBJCXX} ${PLUGIN_CFLAGS} ${OBJCXXFLAGS} ${OBJCFLAGS} ${CXXFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_PLUGIN_OK}; \
	else \
		${COMPILE_PLUGIN_FAILED}; \
	fi

.po.mo:
	${COMPILE_STATUS}
	if ${MSGFMT} -c -o $@ $<; then \
		${COMPILE_OK}; \
	else \
		${COMPILE_FAILED}; \
	fi

.py.pyc:
	${COMPILE_STATUS}
	if ${PYTHON} ${PYTHON_FLAGS} -c "import py_compile; py_compile.compile('$<')"; then \
		${COMPILE_OK}; \
	else \
		${COMPILE_FAILED}; \
	fi

.rc.o .rc.lib.o .rc.plugin.o:
	${COMPILE_STATUS}
	if ${WINDRES} ${CPPFLAGS} -J rc -O coff -o $@ $<; then \
		${COMPILE_OK}; \
	else \
		${COMPILE_FAILED}; \
	fi

.S.o:
	${COMPILE_STATUS}
	if ${AS} ${ASFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_OK}; \
	else \
		${COMPILE_FAILED}; \
	fi
.S.lib.o:
	${COMPILE_LIB_STATUS}
	if ${AS} ${LIB_CFLAGS} ${ASFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_LIB_OK}; \
	else \
		${COMPILE_LIB_FAILED}; \
	fi
.S.plugin.o:
	${COMPILE_PLUGIN_STATUS}
	if ${AS} ${PLUGIN_CFLAGS} ${ASFLAGS} ${CPPFLAGS} -c -o $@ $<; then \
		${COMPILE_PLUGIN_OK}; \
	else \
		${COMPILE_PLUGIN_FAILED}; \
	fi

.xpm.o:
	${COMPILE_STATUS}
	if ${CC} ${CFLAGS} ${CPPFLAGS} -x c -c -o $@ $<; then \
		${COMPILE_OK}; \
	else \
		${COMPILE_FAILED}; \
	fi
.xpm.lib.o:
	${COMPILE_LIB_STATUS}
	if ${CC} ${LIB_CFLAGS} ${CFLAGS} ${CPPFLAGS} -x c -c -o $@ $<; then \
		${COMPILE_LIB_OK}; \
	else \
		${COMPILE_LIB_FAILED}; \
	fi
.xpm.plugin.o:
	${COMPILE_PLUGIN_STATUS}
	if ${CC} ${PLUGIN_CFLAGS} ${CFLAGS} ${CPPFLAGS} -x c -c -o $@ $<; then \
		${COMPILE_PLUGIN_OK}; \
	else \
		${COMPILE_PLUGIN_FAILED}; \
	fi

install: ${SHARED_LIB} ${STATIC_LIB} ${STATIC_PIC_LIB} ${PLUGIN} ${PROG} install-extra
	for i in ${SUBDIRS}; do \
		${DIR_ENTER}; \
		${MAKE} ${MFLAGS} install || exit $$?; \
		${DIR_LEAVE}; \
	done

	for i in ${SHARED_LIB}; do \
		${INSTALL_STATUS}; \
		if ${MKDIR_P} ${DESTDIR}${libdir} && ${INSTALL_LIB}; then \
			${INSTALL_OK}; \
		else \
			${INSTALL_FAILED}; \
		fi \
	done

	for i in ${STATIC_LIB} ${STATIC_PIC_LIB}; do \
		${INSTALL_STATUS}; \
		if ${MKDIR_P} ${DESTDIR}${libdir} && ${INSTALL} -m 644 $$i ${DESTDIR}${libdir}/$$i; then \
			${INSTALL_OK}; \
		else \
			${INSTALL_FAILED}; \
		fi \
	done

	for i in ${PLUGIN}; do \
		${INSTALL_STATUS}; \
		if ${MKDIR_P} ${DESTDIR}${plugindir} && ${INSTALL} -m 755 $$i ${DESTDIR}${plugindir}/$$i; then \
			${INSTALL_OK}; \
		else \
			${INSTALL_FAILED}; \
		fi \
	done

	for i in ${DATA}; do \
		${INSTALL_STATUS}; \
		if ${MKDIR_P} $$(dirname ${DESTDIR}${datadir}/${PACKAGE}/$$i) && ${INSTALL} -m 644 $$i ${DESTDIR}${datadir}/${PACKAGE}/$$i; then \
			${INSTALL_OK}; \
		else \
			${INSTALL_FAILED}; \
		fi \
	done

	for i in ${PROG}; do \
		${INSTALL_STATUS}; \
		if ${MKDIR_P} ${DESTDIR}${bindir} && ${INSTALL} -m 755 $$i ${DESTDIR}${bindir}/$$i; then \
			${INSTALL_OK}; \
		else \
			${INSTALL_FAILED}; \
		fi \
	done

	for i in ${INCLUDES}; do \
		${INSTALL_STATUS}; \
		if ${MKDIR_P} ${DESTDIR}${includedir}/${includesubdir} && ${INSTALL} -m 644 $$i ${DESTDIR}${includedir}/${includesubdir}/$$i; then \
			${INSTALL_OK}; \
		else \
			${INSTALL_FAILED}; \
		fi \
	done

	for i in ${MO_FILES}; do \
		${INSTALL_STATUS}; \
		if ${MKDIR_P} ${DESTDIR}${localedir}/$${i%.mo}/LC_MESSAGES && ${INSTALL} -m 644 $$i ${DESTDIR}${localedir}/$${i%.mo}/LC_MESSAGES/${localename}.mo; then \
			${INSTALL_OK}; \
		else \
			${INSTALL_FAILED}; \
		fi \
	done

	for i in ${MAN}; do \
		${INSTALL_STATUS}; \
		if ${MKDIR_P} ${DESTDIR}${mandir}/${mansubdir} && ${INSTALL} -m 644 $$i ${DESTDIR}${mandir}/${mansubdir}/$$i; then \
			${INSTALL_OK}; \
		else \
			${INSTALL_FAILED}; \
		fi \
	done

install-extra:

uninstall: uninstall-extra
	for i in ${SUBDIRS}; do \
		${DIR_ENTER}; \
		${MAKE} ${MFLAGS} uninstall || exit $$?; \
		${DIR_LEAVE}; \
	done

	for i in ${SHARED_LIB}; do \
		if test -f ${DESTDIR}${libdir}/$$i; then \
			if : ${UNINSTALL_LIB}; then \
				${DELETE_OK}; \
			else \
				${DELETE_FAILED}; \
			fi \
		fi; \
	done

	for i in ${STATIC_LIB} ${STATIC_PIC_LIB}; do \
		if test -f ${DESTDIR}${libdir}/$$i; then \
			if rm -f ${DESTDIR}${libdir}/$$i; then \
				${DELETE_OK}; \
			else \
				${DELETE_FAILED}; \
			fi \
		fi \
	done

	for i in ${PLUGIN}; do \
		if test -f ${DESTDIR}${plugindir}/$$i; then \
			if rm -f ${DESTDIR}${plugindir}/$$i; then \
				${DELETE_OK}; \
			else \
				${DELETE_FAILED}; \
			fi \
		fi \
	done
	-rmdir ${DESTDIR}${plugindir} >/dev/null 2>&1

	for i in ${DATA}; do \
		if test -f ${DESTDIR}${datadir}/${PACKAGE}/$$i; then \
			if rm -f ${DESTDIR}${datadir}/${PACKAGE}/$$i; then \
				${DELETE_OK}; \
			else \
				${DELETE_FAILED}; \
			fi \
		fi; \
		rmdir "$$(dirname ${DESTDIR}${datadir}/${PACKAGE}/$$i)" >/dev/null 2>&1 || true; \
	done
	-rmdir ${DESTDIR}${datadir}/${PACKAGE} >/dev/null 2>&1

	for i in ${PROG}; do \
		if test -f ${DESTDIR}${bindir}/$$i; then \
			if rm -f ${DESTDIR}${bindir}/$$i; then \
				${DELETE_OK}; \
			else \
				${DELETE_FAILED}; \
			fi \
		fi \
	done

	for i in ${INCLUDES}; do \
		if test -f ${DESTDIR}${includedir}/${includesubdir}/$$i; then \
			if rm -f ${DESTDIR}${includedir}/${includesubdir}/$$i; then \
				${DELETE_OK}; \
			else \
				${DELETE_FAILED}; \
			fi \
		fi \
	done
	-rmdir ${DESTDIR}${includedir}/${includesubdir} >/dev/null 2>&1

	for i in ${MO_FILES}; do \
		if test -f ${DESTDIR}${localedir}/$${i%.mo}/LC_MESSAGES/${localename}.mo; then \
			if rm -f ${DESTDIR}${localedir}/$${i%.mo}/LC_MESSAGES/${localename}.mo; then \
				${DELETE_OK}; \
			else \
				${DELETE_FAILED}; \
			fi \
		fi \
	done

	for i in ${MAN}; do \
		if test -f ${DESTDIR}${mandir}/${mansubdir}/$$i; then \
			if rm -f ${DESTDIR}${mandir}/${mansubdir}/$$i; then \
				${DELETE_OK}; \
			else \
				${DELETE_FAILED}; \
			fi \
		fi \
	done

uninstall-extra:

clean:
	for i in ${SUBDIRS}; do \
		${DIR_ENTER}; \
		${MAKE} ${MFLAGS} clean || exit $$?; \
		${DIR_LEAVE}; \
	done

	for i in ${DEPS} ${OBJS} ${LIB_OBJS} ${PLUGIN_OBJS} ${PROG} ${PROG_NOINST} ${SHARED_LIB} ${SHARED_LIB_NOINST} ${STATIC_LIB} ${STATIC_LIB_NOINST} ${STATIC_PIC_LIB} ${STATIC_PIC_LIB_NOINST} ${PLUGIN} ${PLUGIN_NOINST} ${CLEAN_LIB} ${MO_FILES} ${CLEAN}; do \
		if test -f $$i -o -d $$i; then \
			if rm -fr $$i; then \
				${DELETE_OK}; \
			else \
				${DELETE_FAILED}; \
			fi \
		fi \
	done

distclean: clean
	for i in ${SUBDIRS}; do \
		${DIR_ENTER}; \
		${MAKE} ${MFLAGS} distclean || exit $$?; \
		${DIR_LEAVE}; \
	done

	for i in ${DISTCLEAN} .deps *~; do \
		if test -f $$i -o -d $$i; then \
			if rm -fr $$i; then \
				${DELETE_OK}; \
			else \
				${DELETE_FAILED}; \
			fi \
		fi \
	done

DIR_ENTER = printf "[K[36mEntering directory [1m$$i(B[m[36m.(B[m\n"; cd $$i || exit $$?
DIR_LEAVE = printf "[K[36mLeaving directory [1m$$i(B[m[36m.(B[m\n"; cd .. || exit $$?
DEPEND_STATUS = printf "[K[33mGenerating dependencies...(B[m\r"
DEPEND_OK = printf "[K[32mSuccessfully generated dependencies.(B[m\n"
DEPEND_FAILED = err=$$?; printf "[K[31mFailed to generate dependencies!(B[m\n"; exit $$err
COMPILE_STATUS = printf "[K[33mCompiling [1m$<(B[m[33m...(B[m\r"
COMPILE_OK = printf "[K[32mSuccessfully compiled [1m$<(B[m[32m.(B[m\n"
COMPILE_FAILED = err=$$?; printf "[K[31mFailed to compile [1m$<(B[m[31m!(B[m\n"; exit $$err
COMPILE_LIB_STATUS = printf "[K[33mCompiling [1m$<(B[m[33m (lib)...(B[m\r"
COMPILE_LIB_OK = printf "[K[32mSuccessfully compiled [1m$<(B[m[32m (lib).(B[m\n"
COMPILE_LIB_FAILED = err=$$?; printf "[K[31mFailed to compile [1m$<(B[m[31m (lib)!(B[m\n"; exit $$err
COMPILE_PLUGIN_STATUS = printf "[K[33mCompiling [1m$<(B[m[33m (plugin)...(B[m\r"
COMPILE_PLUGIN_OK = printf "[K[32mSuccessfully compiled [1m$<(B[m[32m (plugin).(B[m\n"
COMPILE_PLUGIN_FAILED = err=$$?; printf "[K[31mFailed to compile [1m$<(B[m[31m (plugin)!(B[m\n"; exit $$err
LINK_STATUS = printf "[K[33mLinking [1m$@(B[m[33m...(B[m\r"
LINK_OK = printf "[K[32mSuccessfully linked [1m$@(B[m[32m.(B[m\n"
LINK_FAILED = err=$$?; printf "[K[31mFailed to link [1m$@(B[m[31m!(B[m\n"; exit $$err
INSTALL_STATUS = printf "[K[33mInstalling [1m$$i(B[m[33m...(B[m\r"
INSTALL_OK = printf "[K[32mSuccessfully installed [1m$$i(B[m[32m.(B[m\n"
INSTALL_FAILED = err=$$?; printf "[K[31mFailed to install [1m$$i(B[m[31m!(B[m\n"; exit $$err
DELETE_OK = printf "[K[34mDeleted [1m$$i(B[m[34m.(B[m\n"
DELETE_FAILED = err=$$?; printf "[K[31mFailed to delete [1m$$i(B[m[31m!(B[m\n"; exit $$err

include .deps
