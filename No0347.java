import java.util.*;
import java.io.*;
import java.awt.geom.*;
import java.math.*;

public class No0347 {

	static final Scanner in = new Scanner(System.in);
	static final PrintWriter out = new PrintWriter(System.out,false);
	static boolean debug = false;

	static void solve() {
		int n = in.nextInt();
		int b = in.nextInt();
		double[] a = new double[n];
		for (int i=0; i<n; i++) {
			a[i] = in.nextDouble();
		}
		double x1 = 0, x2 = 0;
		for (int i=0; i<n; i++) {
			x1 += a[i]*Math.pow(b, a[i]-1);
			x2 += a[i] == -1 ? Math.log(b) : Math.pow(b, a[i]+1)/(a[i]+1);
		}

		out.printf("%.10f\n",x1);
		out.printf("%.10f\n",x2);
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