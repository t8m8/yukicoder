import strutils, sequtils, algorithm, future

when isMainModule:
  var y = stdin.readLine.parseInt
  echo(2017 - y)