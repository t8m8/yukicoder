import strutils, sequtils

when isMainModule:
  var
    n = stdin.readline.parseint
    a = stdin.readline.split.map(parseint)
  
  for i in 1..2*n-4:
    for j in 0..n-1:
      var
        q = j
        p = i - q
      if p < 0 or n-1 < p: continue
      if p > q:
        var tmp = p
        p = q
        q = tmp
      if a[p] > a[q]: swap(a[p], a[q])
  
  var ans = ""
  for i in 0..n-2:
    ans = ans & $a[i] & " "
  ans = ans & $a[n-1]
  echo ans