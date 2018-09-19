package com.fon.homewifi.docker;

import java.util.Vector;

public class CGroupsTest {
	private static final int MB = 1024 * 1024;
	public static void main(String[] args) {
		System.out.println("Available processors: " + Runtime.getRuntime().availableProcessors());
		System.out.println("Max memory:           " + (Runtime.getRuntime().maxMemory() / MB));
		System.out.println("Total memory:         " + (Runtime.getRuntime().totalMemory() / MB));
		Vector v = new Vector();
		while (true) {
			byte b[] = new byte[1048576];
			v.add(b);
			System.out.println("  free memory: " + (Runtime.getRuntime().freeMemory() / MB));
		}
	}
}
