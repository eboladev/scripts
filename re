#!/bin/sh
#
# Name		re -- Do something under revision control 
# Version	$Id: re,v 1.7 1999/04/03 19:37:07 akos Exp $
#

if [ $# -lt 2 ] 
then
  echo "re: Usage: re cmd file1 [ file2 ... ]" >&2
  exit 1
fi

cmd="$1"
shift

for i in $*; do [ -f RCS/$i,v ] && (co -l $i; chmod u+w $i); done
$cmd $*
for i in $*; do [ -f RCS/$i,v ] && ci -u $i </dev/null; done

#
# End		re
#
