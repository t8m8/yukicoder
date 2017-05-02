import strutils, sequtils

const MOD = 1000007

when isMainModule:
  var
    n = stdin.readline.parseBiggestInt
    a: int64 = n div 2 mod MOD
    b: int64 = a + 1 mod MOD
  n = n mod MOD
  var
    x: int64 = ((a * n mod MOD + n) mod MOD - (a * a) mod MOD + MOD) mod MOD
    y: int64 = ((b * n mod MOD + n) mod MOD - (b * b) mod MOD + MOD) mod MOD
  echo max(x, y)
