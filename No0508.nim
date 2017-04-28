import strutils, sequtils, math

when isMainModule:
  var
    n = stdin.readline.parsebiggestint
    x = sqrt(n.float64 / 3.0)
  echo x.int + 1

