/**
 * Not yo grandma's hello world is not your regular, simple Hello World.
 *
 * This program that illustrates the fundamentals of most all command line
 * programs including use of command line arguments and basic option
 * switches (-m, -c).
 */

import skilstak.c;

/**
 *  A class to print hello world-ish-ness to the terminal in different
 *  ways.
 */
public class hello {

    /**
     * Prints inifinite randomly colored messages filling the terminal.
     *
     * @param message the message to print
     */
    public static void printColor(String message) {
        System.out.println(c.clear);
        while (true) {
            System.out.print(c.rc() + message + " ");
        }
    }

    /**
     * Prints a single message.
     *
     * @param message the message to print
     */
    public static void printPlain(String message) {
        System.out.println(c.clear + message);
    }

    /**
     * Prints inifinite randomly colored messages Christmas style.
     *
     * @param message the message to print
     */
    public static void printMulti(String message) throws InterruptedException {
        while (true) {
            System.out.print(c.clear + c.multi(message));
            Thread.sleep(500);
        }
    }

    /**
     * Parse the arguments looking for the options and name to say
     * hello to.
     *
     * @param args the arguments passed from standard main method
     */
    public static String[] parseArgs(String[] args) {

        String option = "";
        String name = "world";

        if (args.length == 1) {
            if (args[0].startsWith("-")) {
                option = args[0];
            } else {
                name = args[0];
            }
        } else if (args.length > 1) {
            option = args[0];
            name = args[1];
        }

        String[] p = new String[2];
        p[0] = option;
        p[1] = name;

        return p;

    }

    public static void main(String[] args) throws InterruptedException {

        String[] p = parseArgs(args);
        String option = p[0];
        String name = p[1];

        String message = "Hello " + name + "!";

        if (option.equals("-m")) {
            printMulti(message);
        } else if (option.equals("-c")) {
            printColor(message);
        } else {
            printPlain(message);
        }
    }
}
