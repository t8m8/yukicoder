import strutils, sequtils

when isMainModule:
  var
    k = stdin.readline.parseint
    dp = newSeqWith(k+1, 1.0)

  for i in 2..k:
    for j in max(1, i-6)..i-1:
      dp[i] += dp[j] / 6.0

  echo dp[k]
