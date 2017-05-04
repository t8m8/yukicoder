import strutils, sequtils

when isMainModule:
  var
    a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    b = concat(stdin.readline.split.map parseint, @[-1])
  for i in 0..a.len-1:
    if a[i] != b[i]:
      echo a[i]
      quit()
