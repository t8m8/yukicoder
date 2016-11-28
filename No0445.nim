import strutils, sequtils

when isMainModule:
  var
    tmp = stdin.readLine.split.map(parseInt)
    (a, b) = (tmp[0], tmp[1])

  echo 50 * a + 500 * a div (8 + 2 * b)