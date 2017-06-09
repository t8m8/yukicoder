{.warning[SmallLshouldNotBeUsed]: off.}

import strutils, sequtils, algorithm, future

when isMainModule:
  var
    s = stdin.readline
    (a, b) = (0, 0)

  for i in 0..<s.len-1:
    if s[i..i+1] == "*)":
      a += 1
    elif s[i..i+1] == "(*":
      b += 1

  echo a, " ", b