import strutils, sequtils, algorithm

var
  n = stdin.readline.parseint
  x = stdin.readline.split.map(parseint)

sort(x, system.cmp[int])

for i in 1..x.len()-1:
  if x[i-1] == x[i] or (i > 1 and x[i-1] - x[i-2] != x[i] - x[i-1]):
    "NO".echo
    quit()

"YES".echo