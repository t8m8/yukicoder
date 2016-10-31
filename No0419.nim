import strutils, sequtils, math

var
  tmp = stdin.readline.split.map(parsefloat)
  (a, b) = (tmp[0], tmp[1])
  ans = a*a + b*b

if a*a - b*b > 0:
  ans = min(ans, a*a - b*b)
if b*b - a*a > 0:
  ans = min(ans, b*b - a*a)

echo ans.sqrt