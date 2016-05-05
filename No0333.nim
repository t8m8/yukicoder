import strutils, sequtils

var a = stdin.readLine.split.map(parseInt)

if a[0] > a[1]:
    echo (2000000000 - a[1] - 1)
else:
    echo (a[1] - 2)