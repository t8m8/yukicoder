import strutils, sequtils, algorithm

proc f(a: seq[int]; x, mid, n, m: int): bool =
  var
    val = x + a[mid]
    b = concat(a[0..mid-1], a[mid+1..n-2])
    (l, r) = (0, n-3)
    cnt = 0
  
  while l < r:
    var p = b[l] + b[r]
    if p > val:
      cnt.inc
      l.inc
      r.dec
    else:
      l.inc
    
  result = cnt < m

when isMainModule:
  var
    input = stdin.readline.split.map(parseint)
    (n, m) = (input[0], input[1])
    a = newSeq[int]()
    x = stdin.readline.parseint
  for i in 0..n-2:
    a.add stdin.readline.parseint
  a.sort(system.cmp)

  var (l, r) = (-1, n-2)
  while r - l > 1:
    var mid = (l + r) div 2
    if f(a, x, mid, n, m): r = mid
    else: l = mid

  echo if f(a, x, r, n, m): $a[r] else: "-1"