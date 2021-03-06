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
# Additional extensions for building single-file modules.

.SUFFIXES: $(PLUGIN_SUFFIX)

plugindir = ${MODDIR}/modules/$(MODULE)
PLUGIN=${SRCS:.c=$(PLUGIN_SUFFIX)}

install: $(PLUGIN)

.c$(PLUGIN_SUFFIX):
	${COMPILE_STATUS}
	if ${CC} -MMD -MP ${CFLAGS} ${PLUGIN_CFLAGS} ${CPPFLAGS} ${PLUGIN_LDFLAGS} ${LDFLAGS} -o $@ $< ${LIBS}; then \
		${COMPILE_OK}; \
	else \
		${COMPILE_FAILED}; \
	fi

COMPILE_OK = printf "\033[K\033[0;32mSuccessfully compiled \033[1;32m$<\033[0;32m as \033[1;32m$@\033[0;32m.\033[0m\n"

-include *.d
