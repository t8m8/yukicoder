import strutils, sequtils

var
  s = stdin.readline
  idx = 0

for i in 1..len(s)-3:
  if s[i] == 'c' and s[i+1] == 'c' and s[i+2] == 'w':
    idx = i

echo min(idx+1, len(s) - (idx+2))