import strutils, sequtils

proc idx(c: char): int = c.int - 'a'.int

when isMainModule:
  var
    s = stdin.readline
    cnt = newSeq[int](26)
  for c in s:
    cnt[c.idx].inc

  echo min([cnt['t'.idx], cnt['r'.idx], cnt['e'.idx] div 2])
  
    