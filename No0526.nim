import strutils, sequtils, algorithm, future

when isMainModule:
  var
    input = stdin.readLine.split.map(parseInt)
    (n, m) = (input[0], input[1])
    (a, b) = (0, 1)
  for i in 3..n:
    var x = (a + b) mod m
    a = b
    b = x
  echo b