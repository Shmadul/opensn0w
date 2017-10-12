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

LIB_CFLAGS ?= -fPIC
LOCALEDIR ?= @LOCALEDIR@
XGETTEXT ?= @XGETTEXT@
pdfdir ?= ${docdir}
ECHO_N ?= 
sharedstatedir ?= ${prefix}/com
PKG_CONFIG ?= @PKG_CONFIG@
OBJEXT ?= o
PLUGIN_SUFFIX ?= .impl
DATADIR ?= ${prefix}/etc
sysconfdir ?= ${prefix}/etc
mkdir_p ?= mkdir -p
CLEAN_LIB ?= 
htmldir ?= ${docdir}
bindir ?= ${exec_prefix}/bin
RPATH ?= 
PACKAGE_URL ?= 
BUILDROOT ?= /Users/shmadul/opensn0w
LDAP_AUTHC ?= @LDAP_AUTHC@
PACKAGE_STRING ?= opensn0w 2.0.0
dvidir ?= ${docdir}
sbindir ?= ${exec_prefix}/sbin
CP ?= /bin/cp
SET_MAKE ?= 
PACKAGE_BUGREPORT ?= support@beige-box.com
POSIX_CRYPTC ?= @POSIX_CRYPTC@
PLUGIN_CFLAGS ?= -fPIC
ECHO_C ?= \c
subdirs ?= @subdirs@
psdir ?= ${docdir}
PCRE_CFLAGS ?= @PCRE_CFLAGS@
POSUB ?= @POSUB@
MSGFMT ?= @MSGFMT@
CPP ?= gcc -E
oldincludedir ?= /usr/include
MKINSTALLDIRS ?= @MKINSTALLDIRS@
UNINSTALL_LIB ?= rm -f ${DESTDIR}${libdir}/$$i ${DESTDIR}${libdir}/$${i%.dylib}.${LIB_MAJOR}.dylib ${DESTDIR}${libdir}/$${i%.dylib}.${LIB_MAJOR}.${LIB_MINOR}.dylib
datadir ?= ${datarootdir}
build ?= i686-apple-darwin16.7.0
PODIR ?= @PODIR@
LTLIBICONV ?= @LTLIBICONV@
CPPFLAGS ?= -g -O2  -std=gnu99 -Werror-implicit-function-declaration  -DPREFIX=\"${prefix}\" -DLOCALEDIR=\"${LOCALEDIR}\" -DMODDIR=\"${MODDIR}\" -DSHAREDIR=\"${prefix}\" -DSYSCONFDIR=\"${prefix}/etc\" -DLOGDIR=\"${prefix}/var\" -DRUNDIR=\"${prefix}/var\" -DDATADIR=\"${prefix}/etc\"
SHELL ?= /bin/sh
LIB_PREFIX ?= lib
build_vendor ?= apple
LDAP_CFLAGS ?= @LDAP_CFLAGS@
program_transform_name ?= s,x,x,
host_cpu ?= i686
CC ?= gcc -std=gnu99
mandir ?= ${datarootdir}/man
PACKAGE ?= opensn0w
MKDEP ?= gcc -MM
DEFS ?= -DHAVE_CONFIG_H
LIBS ?= -lssl -lcrypto -lcurl -lreadline -lusb-1.0 -lpthread -ldl -lz  /Users/shmadul/opensn0w//prebuilt/libusb-1.0.a -framework IOKit -framework CoreFoundation 
target_alias ?= 
build_cpu ?= i686
TAR ?= /usr/bin/tar
BUILDDIR ?= /Users/shmadul/opensn0w
infodir ?= ${datarootdir}/info
SHAREDIR ?= ${prefix}
LTLIBINTL ?= @LTLIBINTL@
PICFLAGS ?= @PICFLAGS@
PLUGIN_CPPFLAGS ?= -DPIC
PACKAGE_NAME ?= opensn0w
libexecdir ?= ${exec_prefix}/libexec
localedir ?= ${datarootdir}/locale
ECHO_T ?= 
MODDIR ?= ${exec_prefix}
LIB_SUFFIX ?= .dylib
LTLIBOBJS ?= 
LIBOBJS ?= 
SRCDIR ?= .
LIBICONV ?= @LIBICONV@
includedir ?= ${prefix}/include
LDFLAGS ?= 
ac_ct_CC ?= gcc
build_alias ?= 
PACKAGE_VERSION ?= 2.0.0
USE_NLS ?= @USE_NLS@
LDFLAGS_RPATH ?= -Wl,-rpath,${libdir}
libdir ?= ${exec_prefix}/lib
CFLAGS ?= -g -O2
INSTALL_LIB ?= ${INSTALL} -m 755 $$i ${DESTDIR}${libdir}/$${i%.dylib}.${LIB_MAJOR}.${LIB_MINOR}.dylib && ${LN_S} -f $${i%.dylib}.${LIB_MAJOR}.${LIB_MINOR}.dylib ${DESTDIR}${libdir}/$${i%.dylib}.${LIB_MAJOR}.dylib && ${LN_S} -f $${i%.dylib}.${LIB_MAJOR}.${LIB_MINOR}.dylib ${DESTDIR}${libdir}/$$i
RUNDIR ?= ${prefix}/var
DOCDIR ?= ${prefix}/doc
localstatedir ?= ${prefix}/var
docdir ?= ${datarootdir}/doc/${PACKAGE_TARNAME}
GREP ?= /usr/bin/grep
LIB_LDFLAGS ?= -compatibility_version ${LIB_MAJOR}.${LIB_MINOR} -current_version ${LIB_MAJOR}.${LIB_MINOR} -install_name ${libdir}/${LIB} -dynamiclib -flat_namespace
host_vendor ?= apple
build_os ?= darwin16.7.0
SSL_LIBS ?= @SSL_LIBS@
host_alias ?= 
INSTALL_SCRIPT ?= ${INSTALL}
PACKAGE_TARNAME ?= opensn0w
INSTALL_DATA ?= ${INSTALL} -m 644
LOGDIR ?= ${prefix}/var
RANLIB ?= /opt/local/bin/ranlib
datarootdir ?= ${prefix}/share
LN ?= /bin/ln
LDAP_LIBS ?= @LDAP_LIBS@
PCRE_LIBS ?= @PCRE_LIBS@
ABSPATHS ?= #
RM ?= /bin/rm
INSTALL_PROGRAM ?= ${INSTALL}
PLUGIN_LDFLAGS ?= -bundle -flat_namespace -undefined suppress
PATH_SEPARATOR ?= :
EXEEXT ?= 
MV ?= /bin/mv
INTLLIBS ?= @INTLLIBS@
MSGMERGE ?= @MSGMERGE@
LIB_CPPFLAGS ?= -DPIC
GMSGFMT ?= @GMSGFMT@
host_os ?= darwin16.7.0
exec_prefix ?= ${prefix}
AR ?= /opt/local/bin/ar
host ?= i686-apple-darwin16.7.0
LIBINTL ?= @LIBINTL@
EGREP ?= /usr/bin/grep -E
VERSION ?= 2.0.0
prefix ?= /opensn0w
CRACKLIB_C ?= @CRACKLIB_C@
CONTRIB_ENABLE ?= 
PERL_ENABLE ?= @PERL_ENABLE@
PERL_CFLAGS ?= @PERL_CFLAGS@
PERL_LIBS ?= @PERL_LIBS@
STACKTRACE_ENABLE ?= @STACKTRACE_ENABLE@
STACKTRACE_LIBS ?= 
PYTHON_ENABLE ?= @PYTHON_ENABLE@
PYTHON_CFLAGS ?= @PYTHON_CFLAGS@
PYTHON_LIBS ?= @PYTHON_LIBS@
