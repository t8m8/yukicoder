import strutils

var 
    x : int64 = stdin.readLine.parseBiggestInt
    i = 1'i64
    ans = 1'i64

while i*i <= x:
    i += 1
    if x mod i != 0: continue
    var cnt = 0
    while x mod i == 0:
        x = x /% i
        cnt += 1

    if cnt mod 2 == 1:
        ans *= i

if x > 1:
    ans *= x

ans.echo