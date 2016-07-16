import java.util.*;
import java.io.*;
import java.awt.geom.*;
import java.math.*;

public class No0390 {

	static final Scanner in = new Scanner(System.in);
	static final PrintWriter out = new PrintWriter(System.out,false);
	static boolean debug = false;

	static void solve() {
		int n = in.nextInt();
		int[] a = new int[n];
		for (int i=0; i<n; i++) {
			a[i] = in.nextInt();
		}

		int MAX = 1000001;
		int[] dp = new int[MAX];
		for (int x : a) {
			dp[x] = 1;
		}
		int ans = 1;
		for (int i=1; i<MAX; i++) {
			if (dp[i] == 0) continue;
			for (int j=i+i; j<MAX; j+=i) {
				if (dp[j] != 0) {
					dp[j] = Math.max(dp[i] + 1, dp[j]);
				}
			}
			ans = Math.max(ans, dp[i]);
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