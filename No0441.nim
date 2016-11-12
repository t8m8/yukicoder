import strutils, sequtils

when isMainModule:
  var
    tmp = stdin.readline.split
    (a, b) = (tmp[0], tmp[1])

  if a == b and (a == "0" or a == "2"):
    echo "E"
  elif a == "0" or b == "0" or a == "1" or b == "1":
    echo "S"
  else:
    echo "P"