import strutils, sequtils

when isMainModule:
  var n = stdin.readline.parseint
  var sum = 0;
  for i in 0..n-1:
    var t = stdin.readline.split
    var
      h1 = t[0].split(":")[0].parseint
      m1 = t[0].split(":")[1].parseint
      h2 = t[1].split(":")[0].parseint
      m2 = t[1].split(":")[1].parseint
    if m1 <= m2:
      sum += m2 - m1
    else:
      sum += 60 + m2 - m1
      h2 = (h2 - 1 + 24) mod 24
    if h1 <= h2:
      sum += (h2 - h1) * 60
    else:
      sum += (24 + h2 - h1) * 60
  echo sum
    
