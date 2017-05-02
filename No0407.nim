import strutils, sequtils

proc sieve(n: int): seq[int] =
  result = newSeq[int]()
  var isPrime = repeat[bool](true, n+1)
  isPrime[0] = false
  isPrime[1] = false
  for i in 2..n:
    if isPrime[i]:
      result.add(i)
      for j in countUp(i+i, n, i):
        isPrime[j] = false

when isMainModule:
  var
    input = stdin.readline.split.map(parseint)
    (n, m) = (input[0], input[1])
    primes = sieve(m)
    ans: int64 = 0

  for p in primes:
    ans += max(0, m - p*(n-1) + 1)
  
  echo ans
