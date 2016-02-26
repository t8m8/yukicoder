import java.util.*;
import java.io.*;
import java.awt.geom.*;
import java.math.*;

public class No0346 {

	static final Scanner in = new Scanner(System.in);
	static final PrintWriter out = new PrintWriter(System.out,false);
	static boolean debug = false;

	static void solve() {
		String s = in.next();
		int n = s.length();
		long ans = 0;

		long[] f = new long[n+1];

		for (int i=0; i<n; i++) {
			if (s.charAt(i) == 'w') f[i]++;
		}

		for (int i=n-1; i>=0; i--) {
			f[i] += f[i+1];
		}

		dump(f);

		for (int i=0; i<n; i++) {
			if (s.charAt(i) != 'c') continue;
			ans += f[i]*(f[i]-1)/2;
		}
		out.println(ans);
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