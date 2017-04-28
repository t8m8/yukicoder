import strutils, sequtils

when isMainModule:
  var
    input = stdin.readline.split.map(parseint)
    (a, b) = (input[0], input[1])
  
  if b / a != float(b div a):
    echo "NO"
  else:
    echo b div a