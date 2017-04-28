import strutils, sequtils

when isMainModule:
  var
    s = stdin.readline
    cnt = 0
    east = s.len+1
    west = s.len+1
  
  for i in 0..s.len-3:
    if s[i] == 'O' and s[i+1] == 'O' and s[i+2] == 'O':
      east = min(east, i)
    elif s[i] == 'X' and s[i+1] == 'X' and s[i+2] == 'X':
      west = min(west, i)
  
  if east < west:
    echo "East"
  elif east > west:
    echo "West"
  else:
    echo "NA"

