import strutils, sequtils

var
  tmp = stdin.readline.split.map(parseint)
  (h, w) = (tmp[0], tmp[1])

if h > w:
  echo "TATE"
else:
  echo "YOKO"