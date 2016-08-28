import strutils, sequtils

var p = stdin.readline.split.map(parseint)
var q = stdin.readline.split.map(parseint)

var ans = abs(p[0] - q[0])/2 + abs(p[1] - q[1])/2

echo(ans)