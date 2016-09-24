import strutils, sequtils, queues

var
  tmp = stdin.readline.split.map(parseint)
  (h, w) = (tmp[0], tmp[1])
  tmp2 = stdin.readline.split.map(parseint)
  (sy, sx, gy, gx) = (tmp2[0]-1, tmp2[1]-1, tmp2[2]-1, tmp2[3]-1)
  b : seq[string] = @[]

for i in 1..h:
  b.add(stdin.readline)

const
  dx = [0, 1, 0, -1]
  dy = [1, 0, -1, 0]

var
  q = initQueue[int]()
  visited : seq[bool] = newSeqWith(h*w, false)
q.add(sy*w+sx)

while q.len > 0:
  var
    t = q.dequeue
    (cy, cx) = (t div w, t mod w)

  if cy == gy and cx == gx:
    "YES".echo
    quit()

  for k in 0..3:
    var (ny, nx) = (cy + dy[k], cx + dx[k])
    if ny < 0 or nx < 0 or h <= ny or w <= nx: continue
    if not visited[ny*w+nx] and abs(b[ny][nx].int - b[cy][cx].int) <= 1:
      visited[ny*w+nx] = true
      q.add(ny*w+nx)

  for k in 0..3:
    var (ny, nx) = (cy + 2*dy[k], cx + 2*dx[k])
    if ny < 0 or nx < 0 or h <= ny or w <= nx: continue
    if not visited[ny*w+nx] and b[ny][nx] == b[cy][cx] and b[ny][nx] > b[cy+dy[k]][cx+dx[k]]:
      visited[ny*w+nx] = true
      q.add(ny*w+nx)

"NO".echo