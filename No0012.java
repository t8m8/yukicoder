import java.util.*;
import java.io.*;
import java.awt.geom.*;
import java.math.*;

public class No0012 {

	static final Scanner in = new Scanner(System.in);
	static final PrintWriter out = new PrintWriter(System.out,false);
	static boolean debug = false;

	static void solve() {
		int n = in.nextInt();
		int bit = 0;
		for (int i=0; i<n; i++) {
			bit |= 1<<in.nextInt();
		}

		if (bit == 1023) {
			out.println("4999999");
			return;
		}

		BitSet isp = new BitSet();
		isp.flip(2, 5000001);
		ArrayList<Integer> primes = new ArrayList<>();
		for (int i=2; i*i<=5000001; i=isp.nextSetBit(i+1)) {
			for (int j=i+i; j<5000001; j+=i) {
				isp.set(j, false);
			}
		}

		for (int i=2; i>=0; i=isp.nextSetBit(i+1)) {
			primes.add(i);
		}

		dump(isp.cardinality());

		dump(primes);

		int m = primes.size();
		int[] mask = new int[m];
		int pos = 0;
		for (int p : primes) {
			int b = 0;
			while (p > 0) {
				b |= 1<<(p%10);
				p /= 10;
			}
			mask[pos++] = b;
		}


		int ans = -1;
		for (int i=0; i<m; i++) {
			int b = 0;
			for (int j=0; i+j<m; j++) {
				b |= mask[i+j];
				if ((b&(~bit)) > 0) break;
				if (b == bit) {
					ans = Math.max(ans, (i+j+1 < m ? primes.get(i+j+1)-1 : 499999) - (i > 0 ? primes.get(i-1)+1 : 1));
				}
			}
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