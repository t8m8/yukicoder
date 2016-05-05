import strutils, sequtils, math

var
    n = stdin.readLine.parseBiggestInt
    a = stdin.readLine.split.map(parseBiggestInt)
    x = lcm(a[0], a[1])
    y = lcm(a[1], a[2])
    z = lcm(a[2], a[0])

echo (n div a[0] + n div a[1] + n div a[2] - n div x - n div y - n div z + n div lcm(x, a[2]))
