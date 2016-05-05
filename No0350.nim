import strutils, sequtils, math

let a = stdin.readLine.split.map(parseFloat)
((a[0]*100000*a[1]).toInt div 100000).echo