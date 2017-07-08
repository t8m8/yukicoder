import strutils, sequtils, algorithm, future, sets

{.warning[SmallLshouldNotBeUsed]: off.}

when isMainModule:
  var
    n = stdin.readLine.parseBiggestInt
    i = 1
    s = initSet[string]()

  while i*i <= n:
    if n mod i == 0:
      var p = n div i
      s.incl($p & $i)
      s.incl($i & $p)
    i.inc

  echo s.card