import strutils, sequtils

when isMainModule:
  var
    n = stdin.readline.parseint
    p = stdin.readline.parseint
    ans = 1
  echo ans
  for i in 0..n-2:
    var a = stdin.readline.parseint
    if p < a: ans.inc
    echo ans
  