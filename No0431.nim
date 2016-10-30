import strutils, sequtils

var f = stdin.readline.split.map(parseint)

if f[3] == 1 or f[0] + f[1] + f[2] < 2:
  "SURVIVED".echo
else:
  "DEAD".echo