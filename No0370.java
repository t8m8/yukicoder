import java.util.*;
import java.io.*;
import java.awt.geom.*;
import java.math.*;

public class No0370 {

	static final Scanner in = new Scanner(System.in);
	static final PrintWriter out = new PrintWriter(System.out,false);
	static boolean debug = false;

	static void solve() {
		int n = in.nextInt();
		int m = in.nextInt();
		int[] d = new int[m];
		for (int i=0; i<m; i++) {
			d[i] = in.nextInt();
		}
		Arrays.sort(d);
		int ans = Integer.MAX_VALUE/2;
		int l = 0, r = n-1;
		while (r < m) {
			if (d[r] <= 0) {
				ans = Math.min(ans, -d[l]);
			} else if (0 <= d[l]) {
				ans = Math.min(ans, d[r]);
			} else {
				ans = Math.min(ans, Math.min(-2*d[l] + d[r], -d[l] + 2*d[r]));
			}
			l++; r++;
		}
		out.println(ans);
	}

	public static void main(String[] args) {
		debug = args.length > 0;
		long start = System.nanoTime();

		solve();
		out.flush();

		long end = System.nanoTime();
		dump((end - start) / 1000000 + " ms");
		in.close();
		out.close();
	}

	static void dump(Object... o) { if (debug) System.err.println(Arrays.deepToString(o)); }
}