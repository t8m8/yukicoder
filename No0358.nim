import strutils, sequtils

let a = stdin.readLine.split.map(parseInt)

if a[0] != a[1] and a[1] != a[2] and a[2] != a[0] and (max(a) == a[1] or min(a) == a[1]):
    echo ("INF")
else:
    var cnt = 0
    for p in 1..max(a):
        let (m0, m1, m2) = (a[0] mod p, a[1] mod p, a[2] mod p)
        if m0 != m1 and m1 != m2 and m0 != m2 and (max(m0, m1, m2) == m1 or min(m0, m1, m2) == m1):
            cnt += 1
    echo (cnt)