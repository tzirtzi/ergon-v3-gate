#!/bin/sh
# Every gate file present holds its exact line; D's file needs A's, B's and C's.
set -eu
status=0
check() {
  if [ -f "$1" ]; then
    if printf '%s\n' "$2" | cmp -s - "$1"; then
      echo "ok: $1"
    else
      echo "::error file=$1,line=1::$1 does not hold exactly: $2"
      status=1
    fi
  fi
}
check gate/a.txt 'A: the root of the diamond'
check gate/b.txt 'B: after A'
check gate/c.txt 'C: after A'
check gate/d.txt 'D: after B and C'
if [ -f gate/d.txt ]; then
  for f in gate/a.txt gate/b.txt gate/c.txt; do
    if [ ! -f "$f" ]; then
      echo "::error file=gate/d.txt,line=1::D is present without $f"
      status=1
    fi
  done
fi
exit "$status"
