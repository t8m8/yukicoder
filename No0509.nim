import strutils, sequtils

when isMainModule:
  var
    n = stdin.readline
    a = [1, 0, 0, 0, 1, 0, 1, 0, 2, 1]
    ansA = n.len*2 + 1
    ansB = n.len + 2

  for i in 0..n.len-1:
    ansA += a[n[i].int - '0'.int]
    ansB += a[n[i].int - '0'.int]*2
  
  echo min(ansA, ansB)
