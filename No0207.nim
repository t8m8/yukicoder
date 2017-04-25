import strutils, sequtils

when isMainModule:
  var
    x = stdin.readline.split.map(parseint)
    (a, b) = (x[0], x[1])
  
  for i in a..b:
    if i mod 3 == 0:
      echo i
    elif '3' in $i:
      echo i