import strutils, sequtils, algorithm, future

let
    input = stdin.readline.split.map(parseint)
    (n, k) = (input[0], input[1])
var
    a = stdin.readline.split.map(parseint)
    aIdx : seq[int] = @[]
    bit : seq[int]

proc sum(idx : int) : int =
    var i = idx
    result = 0
    while i > 0 :
        result += bit[i]
        i -= i and -i

proc add(idx, val : int) = 
    var i = idx
    while i <= n :
        bit[i] += val
        i += i and -i

proc isOk : bool =
    let b = a.sorted(cmp[int])
    for i, v in a :
        var idx = b.lowerbound(v)
        aIdx.add(idx + 1)
        if (idx - i).abs mod k != 0 :
            return false
    return true

proc solve(b : seq[int]) : int =
    bit = repeat(0, 2*n+1)
    result = 0
    for i, v in b :
        result += i - sum(v)
        add(v, 1)

if isOk() :
    var ans = 0
    for m in 0..k-1 :
        var b = map(lc[x | (x <- 0..a.len-1, x mod k == m), int], proc(x : int) : int = aIdx[x])
        ans += b.solve
    ans.echo
else :
    "-1".echo 
