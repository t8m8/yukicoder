import strutils, sequtils

let s = stdin.readline
var
  cnt = 0
  f = false

for i in 1..s.len():
  if s[i] == '-': continue
  if s[i-1] == 'm' and s[i] == 'i':
    f = true;
  elif s[i] == 'n' and f and (i+1 >= s.len() or s[i+1] != 'n'):
    cnt += 1
    f = false
  else:
    f = false

cnt.echo
