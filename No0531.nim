import strutils, sequtils, algorithm, future

when isMainModule:
  var
    input = stdin.readLine.split.map(parseInt)
    (n, m) = (input[0], input[1])
  if n <= m:
    echo(1)
  elif n mod 2 == 1 or n div 2 > m:
    echo(-1)
  else:
    echo(2)
