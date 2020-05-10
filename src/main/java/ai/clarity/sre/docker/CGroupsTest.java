package ai.clarity.sre.docker;

import java.text.NumberFormat;
import java.util.Vector;

public class CGroupsTest {
	private static final int MB        = 1024 * 1024;
  private static final String suffix = " MB";

	public static void main(final String[] args) throws Exception {
	  Runtime runtime = Runtime.getRuntime();

	  final NumberFormat formater = NumberFormat.getInstance();

	  final int processors       = runtime.availableProcessors();
	  final long maxMemory       = runtime.maxMemory();
	  final long allocatedMemory = runtime.totalMemory();
	  final long freeMemory      = runtime.freeMemory();

		System.out.println("Available processors: " + processors);
		System.out.println("Max memory:           " + formater.format(maxMemory / MB) + suffix);
		System.out.println("Allocated memory:     " + formater.format(allocatedMemory / MB) + suffix);
		System.out.println("Free memory:          " + formater.format(freeMemory / MB) + suffix);

		@SuppressWarnings("rawtypes")
		final Vector v = new Vector();
		while (true) {
			final byte b[] = new byte[MB];
			v.add(b);
			System.out.println("  free memory: " + formater.format(runtime.freeMemory() / MB) + suffix);
		}
	}
}
