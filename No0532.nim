import strutils, sequtils, algorithm, future

when isMainModule:
  var
    input = stdin.readLine.split.map(parseInt)
    (n, m) = (input[0], input[1])
  if m == 0 and n <= 2:
    echo "Impossible"
  else:
    echo "Possible"