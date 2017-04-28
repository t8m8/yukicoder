import strutils, sequtils

when isMainModule:
  var
    m = stdin.readline.parsebiggestint
    x = 2017 * 2017 mod m
    ans = x
  
  for i in 1..2017-1:
    ans = ans * x mod m
  
  ans = (ans + 2017) mod m
  echo ans
  

