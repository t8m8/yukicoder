import strutils, sequtils

proc calc(H, W, Q: int, s: seq[seq[char]], q: seq[(int, int, int, int)], ans: var seq[int64]) =
  var
    c = newSeqWith(H+1, newSeq[int64](W+2))
    cw = newSeqWith(H+1, newSeq[int64](W+2))
    cww = newSeqWith(H+1, newSeq[int64](W+2))
    wc = newSeqWith(H+1, newSeq[int64](W+2))
    wwc = newSeqWith(H+1, newSeq[int64](W+2))

  for h in 1..H:
    for w in 1..W:
      c[h][w] += c[h][w-1]
      cw[h][w] += cw[h][w-1]
      cww[h][w] += cww[h][w-1]

      if s[h-1][w-1] == 'c':
        c[h][w] += 1
      if s[h-1][w-1] == 'w':
        cw[h][w] += c[h][w-1]
        cww[h][w] += cw[h][w-1]

    var rc = 0
    for w in countDown(W, 1):
      wc[h][w] += wc[h][w+1]
      wwc[h][w] += wwc[h][w+1]

      if s[h-1][w-1] == 'w':
        wc[h][w] += rc
        wwc[h][w] += wc[h][w+1]
      if s[h-1][w-1] == 'c':
        rc += 1

  for k in 0..Q-1:
    var (y1, x1, y2, x2) = q[k]
    for i in y1..y2:
      var
        ccnt = c[i][x2] - c[i][x1-1]
        wcnt = x2 - x1 + 1 - ccnt
      ans[k] += cww[i][x2] - cww[i][x1-1]
      ans[k] += wwc[i][x1] - wwc[i][x2+1]
      ans[k] -= (c[i][W] - ccnt)*wcnt*(wcnt-1) div 2
      ans[k] -= wcnt*(cw[i][x1-1] + wc[i][x2+1])


when isMainModule:
  var
    tmp = stdin.readline.split.map(parseint)
    (H, W) = (tmp[0], tmp[1])
    s = newSeqWith(H, newSeq[char](W))
    s2 = newSeqWith(W, newSeq[char](H))

  for i in 0..H-1:
    var t = stdin.readline
    for j in 0..W-1:
      s[i][j] = t[j]
      s2[j][i] = t[j]

  var
    Q = stdin.readline.parseint
    q: seq[(int, int, int, int)] = @[]
    q2: seq[(int, int, int, int)] = @[]

  for i in 0..Q-1:
    var tmp = stdin.readline.split.map(parseint)
    q.add((tmp[0], tmp[1], tmp[2], tmp[3]))
    q2.add((tmp[1], tmp[0], tmp[3], tmp[2]))

  var ans = newSeq[int64](Q)
  calc(H, W, Q, s, q, ans)
  calc(W, H, Q, s2, q2, ans)
  for i in ans: i.echo