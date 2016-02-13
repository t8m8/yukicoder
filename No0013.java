import java.util.*;
import java.io.*;
import java.awt.geom.*;
import java.math.*;

public class No0013 {

	static final Scanner in = new Scanner(System.in);
	static final PrintWriter out = new PrintWriter(System.out,false);
	static boolean debug = false;

	static int[] dx = { 0, 1, 0,-1};
	static int[] dy = { 1, 0,-1, 0};

	static int[][] t;
	static boolean[][] visited;
	static int h, w;

	static boolean rec(int cx, int cy, int px, int py) {
		if (visited[cx][cy]) {
			return true;
		}
		visited[cx][cy] = true;
		for (int i=0; i<4; i++) {
			int nx = cx + dx[i];
			int ny = cy + dy[i];
			if (nx == px && ny == py) continue;
			if (0 <= nx && 0 <= ny && nx < h && ny < w && t[nx][ny] == t[cx][cy]) {
				if (rec(nx, ny, cx, cy)) return true;
			}
		}

		return false;
	}

	static void solve() {
		w = in.nextInt();
		h = in.nextInt();
		t = new int[h][w];
		for (int i=0; i<h; i++) {
			for (int j=0; j<w; j++) {
				t[i][j] = in.nextInt();
			}
		}

		visited = new boolean[h][w];

		for (int i=0; i<h; i++) {
			for (int j=0; j<w; j++) {
				if (visited[i][j]) continue;
				if (rec(i, j, -1, -1)) {
					out.println("possible");
					return;
				}
			}
		}

		out.println("impossible");
	}

	public static void main(String[] args) {
		debug = args.length > 0;
		long start = System.currentTimeMillis();

		solve();
		out.flush();

		long end = System.currentTimeMillis();
		dump((end-start) + "ms");
		in.close();
		out.close();
	}

	static void dump(Object... o) { if (debug) System.err.println(Arrays.deepToString(o)); }
}