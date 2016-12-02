import strutils, sequtils, math

var a = newSeq[int64](100010)

proc f(i, n: int, b: seq[int64]): bool =
  if i > n: return true
  if i mod 2 == 0:
    a[i] = a[i-1] - b[i-1]
    if a[i] <= 0 or 10^18 < a[i]: return false
    return f(i+1, n, b)
  else:
    a[i] = b[i-1] - a[i-1]
    if a[i] <= 0 or 10^18 < a[i]: return false
    return f(i+1, n, b)

when isMainModule:
  var
    n = stdin.readLine.parseInt
    b = newSeq[int64](n)

  for i in 0..n-1:
    b[i] = stdin.readLine.parseBiggestInt

  let
    sign = [-1, -1, 1, 1]
    mm = [1, -1, -1, 1]
  var
    x = b[0]
    pos = 0
    min: int64 = 0
    max: int64 = b[0]

  for i in 1..b.len-1:
    x  += sign[pos]*b[i]
    if mm[pos] == 1:
      max = min(max, x)
    else:
      min = max(min, x)
    pos = (pos + 1) mod 4

  if min + 1 >= max:
    echo "-1"
    quit()

  a[0] = min+1
  if f(1, n, b):
    echo n+1
    for i in 0..n:
      echo a[i]
  else:
    echo "-1"
    quit()