import strutils, sequtils

let
    n = stdin.readLine.parseInt
    a = stdin.readLine.split.map(parseInt)
var ans = n
for i in 0..n-1 :
    if a[^i-1] == ans : 
        ans -= 1
ans.echo