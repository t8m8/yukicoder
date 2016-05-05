import strutils, sequtils
let a = stdin.readLine.split.map(parseInt)
echo (a[0] - (-a[1]))