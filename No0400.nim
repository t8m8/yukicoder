import strutils, sequtils, algorithm

var s = stdin.readline.reversed

for i in s:
  stdout.write(if i == '>': '<' else: '>')
echo()