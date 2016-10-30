import strutils, sequtils

var
  input = stdin.readline.split.map(parseint)
  (x, y, z) = (input[0], input[1], input[2])

if x == 0 and y == 0:
  if z == 0:
    echo("c")
  else:
    echo("NO")
  quit()

if x == 0:
  if z == 0:
    echo("c")
  else:
    if z mod y == 0 and z div y*2-1 <= 10000:
      var ans = ""
      for i in 1..z div y:
        if ans.len == 0:
          ans = ans & "w"
          continue
        ans = ans & "wC"
      echo(ans)
    else:
      echo("NO")
  quit()

if y == 0:
  if z == 0:
    echo("w")
  else:
    if z mod x == 0 and z div x*2-1 <= 10000:
      var ans = ""
      for i in 1..z div x:
        if ans.len == 0:
          ans = ans & "c"
          continue
        ans = ans & "cC"
      echo(ans)
    else:
      echo("NO")
  quit()

if z == 0:
  echo("ccW")
  quit()

for i in -5000..5000:
  var a : int64 = i
  if (z - a*x) mod y != 0: continue
  var
    b = (z - a*x) div y
    ans = ""
    (f, g) = (false, false)

  if a < 0:
    a = -a
    f = true

  if b < 0:
    b = -b
    g = true

  if 2*a + 2*b - 1 > 10000 : continue
  if a == 0 and b == 0 : continue

  if f:
    ans = ans & "w"
    b -= 1
    for i in 1..a:
      ans = "c" & ans & "W"
    for i in 1..b:
      ans = ans & "wC"
  elif g:
    ans = ans & "c"
    a -= 1
    for i in 1..b:
      ans = "w" & ans & "W"
    for i in 1..a:
      ans = ans & "cC"
  else:
    for i in 1..a:
      if ans.len == 0:
        ans = ans & "c"
        continue
      ans = ans & "cC"
    for i in 1..b:
      if ans.len == 0:
        ans = ans & "w"
        continue
      ans = ans & "wC"

  echo(ans)
  quit()

echo("NO")