import strutils, sequtils, algorithm, future

{.warning[SmallLshouldNotBeUsed]: off.}

when isMainModule:
  var s = stdin.readline
  echo if s[s.len - 2] == 'a' and s[s.len - 1] == 'i': s[0..s.len-3] & "AI" else: s & "-AI"