import strutils, sequtils, algorithm, future, typetraits

{.warning[SmallLshouldNotBeUsed]: off.}

when isMainModule:
  var
    b = stdin.readLine.split.map(parseFloat)
  echo(((b[2]*(b[2]-b[0]) + b[1]*(b[1]-b[2])) / (b[1] - b[0])).int)