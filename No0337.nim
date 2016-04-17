import strutils, sequtils

var n = stdin.readLine.split.map(parseInt)

if n[1] == n[0]*n[1]:
    echo ("=")
else:
    echo ("!=")