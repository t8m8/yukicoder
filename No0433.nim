import strutils, sequtils, algorithm, tables

var
  tmp = stdin.readline.split.map(parseint)
  (n, k) = (tmp[0], tmp[1])
  a: seq[(int, int, int, int)] = @[]
  u = newSeqWith(100000, newSeq[(int, int, int)]())

for i in 0..n-1:
  var tmp = stdin.readline.split.map(parseint)
  u[tmp[2]].add((tmp[0], -tmp[1], i))

for i in 0..u.len-1:
  if u[i].len == 0: continue
  u[i].sort(system.cmp, SortOrder.Descending)
  for j in 0..u[i].len-1:
    a.add((u[i][j][0], -j, u[i][j][1], u[i][j][2]))

a.sort(system.cmp, SortOrder.Descending)
for i in 0..k-1:
  echo a[i][3]