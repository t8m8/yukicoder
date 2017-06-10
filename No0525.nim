import strutils, sequtils, algorithm, future

proc printf(frmt: cstring) {.varargs, header: "<stdio.h>", importc: "printf".}

when isMainModule:
  var
    n = stdin.readLine.split(":").map(parseint)
    (h, m) = (n[0], n[1])
    x = (m + 5) div 60
  m = (m + 5) mod 60
  h = (h + x) mod 24
  printf("%02d:%02d\n", h, m)