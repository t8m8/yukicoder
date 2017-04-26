import strutils, sequtils

when isMainModule:
  var
    n = stdin.readline.parseint
    dp = newSeqWith(n, newSeq[int](2))
    input = stdin.readline.split.map(parseint)

  dp[0][0] = input[0]
  dp[0][1] = dp[0][0]

  for i in 1..n-1:
    var
      a = input[i]
      x = dp[i-1][0]
      y = dp[i-1][1]
    dp[i][0] = max([x, y, x+a, y+a, x-a, y-a, x*a, y*a])
    dp[i][1] = min([x, y, x+a, y+a, x-a, y-a, x*a, y*a])
    if a != 0:
      dp[i][0] = max([dp[i][0], x div a, y div a])
      dp[i][1] = min([dp[i][1], x div a, y div a])

  echo dp[n-1][0]
    
