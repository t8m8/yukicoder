import strutils, sequtils

const INF: int = 1 shl 31;

type
  G = seq[seq[seq[int]]]

proc add(g: var G; u, v, cap: int) =
  g[u].add(@[v, cap, g[v].len])
  g[v].add(@[u, 0, g[u].len-1])

var visited: seq[bool]

proc dfs(g: var G, cur, sink, f: int): int =
  if cur == sink: return f
  visited[cur] = true
  for i in 0..g[cur].len-1:
    var e = g[cur][i]
    if not visited[e[0]] and e[1] > 0:
      var d = dfs(g, e[0], sink, min(f, e[1]))
      if d > 0:
        g[cur][i][1] -= d
        g[e[0]][e[2]][1] += d
        return d

proc fordFulkerson(g: var G; source, sink: int): int =
  while true:
    visited = newSeq[bool](g.len)
    var f = dfs(g, source, sink, INF)
    if f == 0: break
    result += f

when isMainModule:
  var
    w = stdin.readline.parseint
    n = stdin.readline.parseint
    js = stdin.readline.split.map(parseint)
    m = stdin.readline.parseint
    cs = stdin.readline.split.map(parseint)
    g: G = newSeqWith(n + m + 2, newSeqWith(0, newSeq[int]()))
    source = n + m
    sink = n + m + 1

  for i in 0..n-1:
    g.add(source, i, js[i])
  
  for i in n..n+m-1:
    g.add(i, sink, cs[i-n])
    var
      input = stdin.readline.split.map(parseint)
      q = input[0]
      x = input[1..input.len-1]
      pos = 0
    
    for j in 0..n-1:
      if pos < q and x[pos]-1 == j:
        g.add(j, i, 0)
        pos.inc
      else:
        g.add(j, i, INF)

  var f = fordFulkerson(g, source, sink)
  if f >= w:
    echo "SHIROBAKO"
  else:
    echo "BANSAKUTSUKITA"
    
    
