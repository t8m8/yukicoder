import strutils, sequtils

when isMainModule:
  var
    tmp = stdin.readLine.split.map(parseFloat)
    v = tmp[0] + tmp[1]
    d = stdin.readLine.parseFloat
    w = stdin.readLine.parseFloat
    t = d / v
  echo w*t