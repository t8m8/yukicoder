import strutils, sequtils

proc val(ca, c, d: float): float =
  var
    cb = c - ca
    da = ca / 3
    db = cb*5 / 2
  if da <= d:
    result += (ca + da) * 1000
  if da + db <= d:
    result += (cb + db) * 2000

when isMainModule:
  var
    tmp = stdin.readLine.split.map(parseFloat)
    (c, d) = (tmp[0], tmp[1])
    l = 0.0
    r = c

  for i in 0..200:
    var
      ll = (l + l + r) / 3
      rr = (l + r + r) / 3
    if val(ll, c, d) < val(rr, c, d):
      l = ll
    else:
      r = rr

  echo max(val((l + l + r) / 3, c, d), val((l + r + r) / 3, c, d))