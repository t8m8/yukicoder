import java.util.*;
import java.io.*;
import java.awt.geom.*;
import java.math.*;

public class No0395 {

	static final Scanner in = new Scanner(System.in);
	static final PrintWriter out = new PrintWriter(System.out,false);
	static boolean debug = false;

	static void solve() {
		int a = in.nextInt();
		for (int i=8; i<1000; i++) {
			if (7 + i == a) {
				out.println(i);
				return;
			}
		}
		out.println("-1");
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