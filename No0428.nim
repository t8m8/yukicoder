import strutils, sequtils

const d = "1234567891011121314151617181920212223242526272829303132333435363738394041424344454647484950515253545556575859606162636465666768697071727374757677787980818283848586878889909192939495969798991"

var
  n = stdin.readline.parseint
  carry = 0
  ans = ""

for i in countDown(d.len-1, 0):
  carry += n*(d[i].ord - '0'.ord)
  ans &= $(carry mod 10)
  carry = carry div 10

for i in 0..ans.high div 2:
  swap(ans[i], ans[ans.high-i])

echo $carry & "." & ans