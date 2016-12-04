import strutils, sequtils

when isMainModule:
  var
    x = stdin.readline.parsefloat
    ans = 0.0
  let p = 1.6449340668482426
  for i in 1..1000000:
    let n = i.float
    ans -= x*(2*n+x) / (n*n*(n+x)*(n+x))
  echo ans + p