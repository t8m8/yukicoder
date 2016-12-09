import strutils, sequtils, math

proc scanf(frmt: cstring) {.varargs,  header: "<stdio.h>", importc: "scanf".}
proc printf(frmt: cstring) {.varargs, header: "<stdio.h>", importc: "printf".}

var m: int
var a, b, t: float64

proc f(lnx, a, b, t: float64): float64 {.inline, noSideEffect.} = a*lnx + b*ln(lnx) - ln(t)
proc F(x, lnx, a, b, t: float64): float64 {.inline, noSideEffect.} = (a*lnx + b) / (x*lnx)

proc newton(x0: float64): float64 {.inline.} =
  var
    x = x0
    lnx = ln(x)
  for i in 1..25:
    x = x - f(lnx,a,b,t) / F(x,lnx,a,b,t)
    lnx = ln(x)
  result = x

when isMainModule:

  scanf("%d", addr m)

  for i in 0..m-1:
    var n: float64
    scanf("%lf %lf %lf", addr a, addr b, addr t)

    if a == 0: n = exp(pow(t, 1.0/b))
    elif b == 0: n = pow(t, 1.0/a)
    else: n = newton(1.1)

    printf("%.11f\n", n)