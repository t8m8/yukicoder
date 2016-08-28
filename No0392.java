import java.util.*;
import java.io.*;
import java.awt.geom.*;
import java.math.*;

public class No0392 {

	static final Scanner in = new Scanner(System.in);
	static final PrintWriter out = new PrintWriter(System.out,false);
	static boolean debug = false;

	static void solve() {
		int m = in.nextInt();
		for (int i=0; i<m; i++) {
			int a = in.nextInt() + 1;
			StringBuilder sb = new StringBuilder();
			while (a != 1) {
				sb.append(a%2 == 0 ? "L" : "R");
				a /= 2;
			}
			out.println(sb.reverse());
		}
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