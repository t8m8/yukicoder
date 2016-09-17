import strutils, sequtils

let a = ["I", "II", "III", "IIII", "V", "VI", "VII", "VIII", "IX", "X", "XI", "XII"]

var
  input = stdin.readLine.split
  (s, t) = (input[0], parseint(input[1]))

a[(a.find(s) + (t mod 12) + 12) mod 12].echo
