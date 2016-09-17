import strutils, sequtils, algorithm

proc printf(formatstr: cstring) {.header: "<stdio.h>", varargs.}

var
  s = stdin.readline.split.map(parseint).sorted(system.cmp)

printf("%.2f\n", (s[1]+s[2]+s[3]+s[4])/4)