import strutils, sequtils

when isMainModule:
  var
    tmp = stdin.readLine.split.map(parseInt)
    (h, w) = (tmp[0], tmp[1])

  var s = newSeq[string](h)
  for i in 0..h-1:
    s[i] = stdin.readLine

  var p = newSeq[(int, int)]()
  for i in 0..h-1:
    for j in 0..w-1:
      if s[i][j] == '*':
        p.add((i, j))

  var x, y: int
  if p[0][0] == p[1][0]:
    if p[0][0] == h-1: y = p[0][0] - 1
    else: y = p[0][0] + 1
    x = p[0][1]
  else:
    if p[0][1] == w-1: x = p[0][1] - 1
    else: x = p[0][1] + 1
    y = p[0][0]

  for i in 0..h-1:
    for j in 0..w-1:
      if y == i and x == j: stdout.write('*')
      else: stdout.write(s[i][j])
    echo()