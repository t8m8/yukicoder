import strutils, sequtils

when isMainModule:
  var
    s = stdin.readline
    t = "yukicoder"
  
  for i in 0..s.len-1:
    if s[i] == '?':
      echo t[i]
