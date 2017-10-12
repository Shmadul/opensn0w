#! /bin/sh
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

TOP_DIR=$(dirname $0)
LAST_DIR=$PWD

if test ! -f $TOP_DIR/configure.ac ; then
   echo "You must execute this script from the top level directory."
   exit 1
fi

AUTOCONF=${AUTOCONF:-autoconf}
ACLOCAL=${ACLOCAL:-aclocal}
AUTOHEADER=${AUTOHEADER:-autoheader}

dump_help_screen ()
{
   echo "Usage: $0 [options]"
   echo 
   echo "options:"
   echo "  -n           skip CVS changelog creation"
   echo "  -h,--help    show this help screen"
   echo
   exit 0
}

parse_options ()
{
   while test "$1" != "" ; do
      case $1 in
         -h|--help)
            dump_help_screen
            ;;
         -n)
            SKIP_CVS_CHANGELOG=yes
            ;;
         *)
            echo Invalid argument - $1
            dump_help_screen
            ;;
      esac
      shift
   done
}

run_or_die ()
{
   COMMAND=$1
   
   # check for empty commands
   if test -z "$COMMAND" ; then
      echo "*warning* no command specified"
      return 1
   fi
   
   shift;

   OPTIONS="$@"
   
   # print a message
   echo -n "*info* running $COMMAND"
   if test -n "$OPTIONS" ; then
      echo " ($OPTIONS)"
   else
      echo
   fi

   # run or die
   $COMMAND $OPTIONS ; RESULT=$?
   if test $RESULT -ne 0 ; then
      echo "*error* $COMMAND failed. (exit code = $RESULT)"
      exit 1
   fi
   
   return 0
}

parse_options "$@"

cd $TOP_DIR

run_or_die $ACLOCAL -I m4
run_or_die $AUTOHEADER
run_or_die $AUTOCONF
./configure "$@"
