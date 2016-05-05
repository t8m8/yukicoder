import strutils, tables

let n = stdin.readLine.parseInt
var dict = initCountTable[string](16)

for _ in 1..n:
    dict.inc(stdin.readLine, 2)

if dict.largest.val - (n and 1) <= n :
    echo ("YES")
else:
    echo ("NO")