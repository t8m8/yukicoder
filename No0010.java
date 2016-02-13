import java.util.*;
import java.io.*;
import java.awt.geom.*;
import java.math.*;

public class No0010 {

	static final Reader in = new Reader();
	static final PrintWriter out = new PrintWriter(System.out,false);
	static boolean debug = false;

	static void solve(){
		int n = in.nextInt();
		int t = in.nextInt();
		int[] a = new int[n];
		for (int i=0; i<n; i++) {
			a[i] = in.nextInt();
		}

		long[][] dp = new long[n][t+1];
		dp[0][a[0]] = 1;
		for (int i=0; i<n-1; i++) {
			for (int j=0; j<t+1; j++) {
				if (dp[i][j] <= 0) continue;

				if (j + a[i+1] < t+1) {
					if (dp[i+1][j+a[i+1]] == 0) {
						dp[i+1][j+a[i+1]] = (dp[i][j]<<1|1);
					} else {
						long tmp = (dp[i][j]<<1|1);
						if (dp[i+1][j+a[i+1]] < tmp) {
							dp[i+1][j+a[i+1]] = tmp;
						}
					}
				}

				if (j * a[i+1] < t+1) {
					if (dp[i+1][j*a[i+1]] == 0) {
						dp[i+1][j*a[i+1]] = dp[i][j]<<1;
					} else {
						long tmp = dp[i][j]<<1;
						if (dp[i+1][j*a[i+1]] < tmp) {
							dp[i+1][j*a[i+1]] = tmp;
						}
					}
				}
			}
		}

		dump(dp[1]);
		StringBuilder ans = new StringBuilder();
		while (dp[n-1][t] > 1) {
			ans.append(dp[n-1][t]%2 == 1 ? "+" : "*");
			dp[n-1][t] /= 2;
		}
		out.println(ans.reverse());
	}

	public static void main(String[] args) throws Exception {
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

class Reader {
	private final InputStream in;
	private final byte[] buf = new byte[1024];
	private int ptr = 0;
	private int buflen = 0;

	public Reader() { this(System.in);}
	public Reader(InputStream source) { this.in = source;}

	private boolean hasNextByte() {
		if (ptr < buflen) return true;
		ptr = 0;
		try{
			buflen = in.read(buf);
		}catch (IOException e) {e.printStackTrace();}
		if (buflen <= 0) return false;
		return true;
	}

	private int readByte() { if (hasNextByte()) return buf[ptr++]; else return -1;}

	private boolean isPrintableChar(int c) { return 33 <= c && c <= 126;}

	private void skip() { while(hasNextByte() && !isPrintableChar(buf[ptr])) ptr++;}

	public boolean hasNext() {skip(); return hasNextByte();}

	public String next() {
		if (!hasNext()) throw new NoSuchElementException();
		StringBuilder sb = new StringBuilder();
		int b = readByte();
		while (isPrintableChar(b)) {
			sb.appendCodePoint(b);
			b = readByte();
		}
		return sb.toString();
	}

	public long nextLong() {
		if (!hasNext()) throw new NoSuchElementException();
		boolean minus = false;
		long num = readByte();

		if(num == '-'){
			num = 0;
			minus = true;
		}else if (num < '0' || '9' < num){
			throw new NumberFormatException();
		}else{
			num -= '0';
		}

		while(true){
			int b = readByte();
			if('0' <= b && b <= '9')
				num = num * 10 + (b - '0');
			else if(b == -1 || !isPrintableChar(b))
				return minus ? -num : num;
			else
				throw new NoSuchElementException();
		}
	}

	public int nextInt() {
		long num = nextLong();
		if (num < Integer.MIN_VALUE || Integer.MAX_VALUE < num)
			throw new NumberFormatException();
		return (int)num;
	}

	public double nextDouble() {
		return Double.parseDouble(next());
	}

	public char nextChar() {
		if (!hasNext()) throw new NoSuchElementException();
		return (char)readByte();
	}

	public String nextLine() {
		while (hasNextByte() && (buf[ptr] == '\n' || buf[ptr] == '\r')) ptr++;
		if (!hasNextByte()) throw new NoSuchElementException();

		StringBuilder sb = new StringBuilder();
		int b = readByte();
		while (b != '\n' && b != '\r') {
			sb.appendCodePoint(b);
			b = readByte();
		}

		return sb.toString();
	}

	public int[] nextIntArray(int n) {
		int[] res = new int[n];
		for (int i=0; i<n; i++) res[i] = nextInt();
		return res;
	}

	public char[] nextCharArray(int n) {
		char[] res = new char[n];
		for (int i=0; i<n; i++) res[i] = nextChar();
		return res;
	}

	public void close() {try{ in.close();}catch(IOException e){ e.printStackTrace();}};
}