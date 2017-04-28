import strutils, sequtils, algorithm

when isMainModule:
  var
    input = stdin.readline.split.map(parseint)
    (n, d) = (input[0], input[1])
    cnt = newSeq[int](n)
    pos = 0

  for i in 0..d-1:
    cnt[pos].inc
    pos = (pos + 1) mod n

  var ans = ""
  for i in 0..n-1:
    if cnt[i] == 0: ans = ans & "C"
    elif cnt[i] == 1: ans = ans & "A"
    elif cnt[i] == 2: ans = ans & "B"
  
  ans.sort(system.cmp)
  echo ans
