import strutils, sequtils

var start = -1

proc f(g: seq[seq[int]]; i, j, k, l: var int, cur: int, a: seq[int]): bool =
  var flag = i >= 0 and j >= 0 and k >= 0 and l >= 0 
  if flag: start = cur
  if cur == i: i = -1
  if cur == j: j = -1
  if cur == k: k = -1
  if cur == l: l = -1
  if i < 0 and j < 0 and k < 0 and l < 0:
    if start in g[cur]: return true
    else: return false
  var
    next = -1
    cnt = 0
  for to in g[cur]:
    if to in [i, j, k, l]:
      if next < 0:
        next = to
    if to in a: cnt.inc
  if cnt > 2: return false
  if next < 0: return false
  return f(g, i, j, k, l, next, a)
  

when isMainModule:
  var
    input = stdin.readline.split.map(parseint)
    (n, m) = (input[0], input[1])
    g = newSeqWith(n, newSeq[int]())
  
  for i in 0..m-1:
    var
      e = stdin.readline.split.map(parseint)
      (a, b) = (e[0], e[1])
    g[a].add(b)
    g[b].add(a)
  
  var ans = 0
  
  for i in 0..n-1:
    for j in i+1..n-1:
      for k in j+1..n-1:
        for l in k+1..n-1:
          var (I, J, K, L) = (i, j, k, l)
          if f(g, I, J, K, L, i, @[i, j, k, l]):
            ans.inc
  
  echo ans