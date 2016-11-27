import strutils, sequtils, algorithm, math

type
  DisjointSet = ref object
    par: seq[int]

proc newDisjointSet*(n: int): DisjointSet =
  result = DisjointSet(par: newSeq[int](n))
  for i in 0..n-1:
    result.par[i] = i

proc find*(self: DisjointSet, x: int): int =
  if self.par[x] == x:
    result = x
  else:
    self.par[x] = self.find(self.par[x])
    result = self.par[x]

proc same*(self: DisjointSet, x, y: int): bool =
  result = self.find(x) == self.find(y)

proc unite*(self: DisjointSet, x, y: int) =
  let
    s = self.find(x)
    t = self.find(y)
  if s != t: self.par[s] = t

proc `$`*(self: DisjointSet): string =
  result = $self.par

proc kruskal*(n: int, s, t, c: seq[int]): int64 =
  var
    m = s.len
    edges = newSeq[int64](m)

  for i in 0..m-1:
    edges[i] = c[i].int64 shl 32 or i
  edges.sort(cmp[int64])

  var ds = newDisjointSet(n)

  for i in 0..m-1:
    var cur = cast[int32](edges[i])
    if not ds.same(s[cur], t[cur]):
      ds.unite(s[cur], t[cur])
      result = c[cur].int64
    if ds.same(0, n-1): break

when isMainModule:
  var
    n = stdin.readLine.parseInt
    p = newSeqWith(n, newSeq[int](2))

  for i in 0..n-1:
    p[i] = stdin.readLine.split.map(parseInt)

  var
    s: seq[int] = @[]
    t: seq[int] = @[]
    c: seq[int] = @[]
  for i in 0..n-1:
    for j in i+1..n-1:
      s.add(i)
      t.add(j)
      var
        dx = p[i][0] - p[j][0]
        dy = p[i][1] - p[j][1]
        dd = dx*dx + dy*dy
        d = sqrt(dd.float).int64
      while dd > d*d: d += 1
      c.add(int((d+9) div 10 * 10))


  echo kruskal(n, s, t, c)

