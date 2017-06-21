import strutils, sequtils, algorithm, future

{.warning[SmallLshouldNotBeUsed]: off.}

when isMainModule:
  var
    n = stdin.readLine.parseInt
    dp = newSeqWith(n+1, newSeqWith(3, newSeq[int](2)))

  dp[0][0][0] = 1

  for i in 0..<n:
    for j in 0..2:
      for k in 0..1:
        for l in 0..9:
          if l == 3:
            dp[i+1][l mod 3][1] += dp[i][j][k]
          else:
            dp[i+1][l mod 3][k] += dp[i][j][k]

  var ans = 0
  for j in 0..2:
    for k in 0..1:
        if j == 0 or k == 1:
          ans += dp[n][j][k]
  echo ans - 1
