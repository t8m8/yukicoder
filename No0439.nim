import strutils, sequtils

var
  n = stdin.readline.parseint
  s = stdin.readline
  g = newSeqWith(n, newSeq[int]())

for i in 0..n-2:
  var
    tmp = stdin.readline.split.map(parseint)
    (a, b) = (tmp[0]-1, tmp[1]-1)
  g[a].add(b)
  g[b].add(a)

var
  c = newSeq[int64](n)
  w = newSeq[int64](n)
  cAll = s.count('c')
  wAll = s.count('w')

proc dfs(cur, prev: int): int64 =
  if s[cur] == 'c': c[cur] = 1
  else: w[cur] = 1
  for i in g[cur]:
    if i == prev: continue
    result += dfs(i, cur)
    c[cur] += c[i]
    w[cur] += w[i]
    if s[cur] == 'w': result += c[i]*(wAll-1-w[i])
  if prev != -1 and s[cur] == 'w': result += (cAll-c[cur])*(w[cur]-1)

dfs(0, -1).echo