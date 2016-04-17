import strutils, sequtils

var
    a = stdin.readLine.split.map(parseInt)
    ans = 1000

for i in 0..200:
    for j in 0..200:
        if i + j == 0: continue

        if a[0] == ((100*i) / (i+j)).toInt and a[1] == ((100*j) / (i+j)).toInt:
            ans = ans.min(i+j)

ans.echo