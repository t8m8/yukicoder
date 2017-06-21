import strutils, sequtils, algorithm, strscans, future

{.warning[SmallLshouldNotBeUsed]: off.}

const MOD = 1000000007

proc minus1(a: var string): string =
  for i in countDown(a.len-1, 0):
    if a[i] != '0':
      a[i] = ((a[i].int - '0'.int) - 1 + '0'.int).char
      break
    else:
      a[i] = '9'
  while a.len > 1 and a[0] == '0':
    a = a[1..a.len-1]
  result = a

proc solve(a: string, dp: var seq[seq[seq[seq[seq[int]]]]]): int =
  dp[0][0][0][0][0] = 1

  for i in 0..<a.len:
    for j in 0..1:
      for k in 0..1:
        for l in 0..2:
          for m in 0..7:
            for n in 0..9:
              if j == 0 and n > (a[i].int - '0'.int): break
              var
                p = if n < (a[i].int - '0'.int): 1 else: j
                q = if n == 3: 1 else: k
              dp[i+1][p][q][(n + l*10) mod 3][(n + m*10) mod 8] =
                  (dp[i+1][p][q][(n + l*10) mod 3][(n + m*10) mod 8] + dp[i][j][k][l][m]) mod MOD
  for j in 0..1:
    for k in 0..1:
      for l in 0..2:
        for m in 0..7:
          if (k == 1 or l == 0) and m != 0:
            result = (result + dp[a.len][j][k][l][m]) mod MOD

when isMainModule:
  var
    input = stdin.readLine.split
    (a, b) = (input[0].minus1, input[1])
    dpA = newSeqWith(a.len+1, newSeqWith(2, newSeqWith(2, newSeqWith(3, newSeq[int](8)))))
    dpB = newSeqWith(b.len+1, newSeqWith(2, newSeqWith(2, newSeqWith(3, newSeq[int](8)))))

  var
    ansA = solve(a, dpA)
    ansB = solve(b, dpB)

  echo((ansB - ansA + MOD) mod MOD)

