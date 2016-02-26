import java.util.*;
import java.io.*;
import java.awt.geom.*;
import java.math.*;

public class No0345 {

	static final Scanner in = new Scanner(System.in);
	static final PrintWriter out = new PrintWriter(System.out,false);
	static boolean debug = false;

	static void solve() {
		String s = in.next();
		int n = s.length();
		int min = 101;
		for (int i=0; i<n; i++) {
			if (s.charAt(i) != 'c') continue;
			int w = 0;
			for (int j=0; i+j<n; j++) {
				if (s.charAt(i+j) == 'w') w++;
				if (w == 2) {
					min = Math.min(min, j+1);
					break;
				}
			}
		}

		out.println(min == 101 ? "-1" : min);
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