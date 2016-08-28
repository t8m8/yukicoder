import strutils, sequtils, math

var
  input = stdin.readline.split.map(parseint)
  (n, k) = (input[0], input[1])

echo(2^(n-k) - (if k == 1 : n else: 0))