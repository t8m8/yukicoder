{.warning[SmallLshouldNotBeUsed]: off.}

import strutils, sequtils, algorithm, future

proc f(m, vm: int, dp: seq[seq[int]]): bool =
  result = dp[0][m] < vm

proc g(m, vm: int, dp: seq[seq[int]]): bool =
  result = dp[0][m] <= vm

when isMainModule:
  var
    n = stdin.readLine.parseInt
    v = newSeq[int](n)
    w = newSeq[int](n)

  for i in 0..<n:
    var t = stdin.readLine.split.map(parseInt)
    (v[i], w[i]) = (t[0], t[1])

  var
    vm = stdin.readLine.parseInt

  var
    W = 100001
    dp = newSeqWith(n+1, newSeq[int](W+1))
  for i in countDown(n-1, 0):
    for j in 0..W:
      if j < w[i]:
        dp[i][j] = dp[i+1][j]
      else:
        dp[i][j] = max(dp[i+1][j], dp[i+1][j-w[i]] + v[i])

  var (l, r) = (-1, W)
  while r - l > 1:
    var m = (l + r) div 2
    if f(m, vm, dp): l = m
    else: r = m

  var a = -1
  for i in max(1, l-5)..min(l+5, W-1):
    if not f(i, vm, dp):
      a = i
      break
  echo a

  (l, r) = (-1, W)
  while r - l > 1:
    var m = (l + r) div 2
    if g(m, vm, dp): l = m
    else: r = m

  var b = l-5
  for i in max(1, l-5)..min(l+5, W-1):
    if g(i, vm, dp):
      b = i
    else:
      break
  if not g(b+1, vm, dp):
    echo b
  else:
    echo "inf"