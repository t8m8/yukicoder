import strutils, sequtils

var t = stdin.readline.parseint

proc num(i,j : int): int =
  result = i + j
  if result >= 10: result = num(result div 10, result mod 10)

proc val(cur: string): string =
  if cur.len == 1: return cur
  result = ""
  for i in 0..cur.len-2:
    result &= $num(ord(cur[i]) - ord('0'), ord(cur[i+1]) - ord('0'))
  return result.val

for i in 1..t:
  var s = stdin.readline
  echo s.val