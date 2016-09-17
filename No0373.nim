import strutils, sequtils

var a = stdin.readline.split.map(parseBiggestInt)

echo(((a[0] mod a[3]) * (a[1] mod a[3]) mod a[3] * (a[2] mod a[3])) mod a[3])