import strutils, sequtils

var
  s = stdin.readline
  n = len(s)

proc rec(used: seq[bool]): int =
  for i in 0..n-1:
    for j in i+1..n-1:
      for k in j+1..n-1:
        if (used[i] or used[j] or used[k]): continue
        if (s[i] != '0' and s[j] == s[k] and s[i] != s[j]):
          var a = used
          (a[i], a[j], a[k]) = (true, true, true)
          result = max(result, rec(a) + parseint(s[i]&s[j]&s[k]))

echo(rec(newSeq[bool](n)))