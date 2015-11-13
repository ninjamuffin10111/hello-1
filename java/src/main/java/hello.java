/**
 * Not yo grandma's hello world is not your regular, simple Hello World.
 *
 * This program that illustrates the fundamentals of most all command line
 * programs including use of command line arguments and basic option
 * switches (-m, -c).
 */

import skilstak.c;
import java.util.HashMap;

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
    public static void color(String message) {
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
    public static void plain(String message) {
        System.out.println(c.clear + message);
    }

    /**
     * Prints inifinite randomly colored messages Christmas style.
     *
     * @param message the message to print
     */
    public static void multi(String message) throws InterruptedException {
        while (true) {
            System.out.print(c.clear + c.multi(message));
            Thread.sleep(500);
        }
    }

    /**
     * Parse the arguments looking for the options and who to say
     * hello to.
     *
     * @param args the arguments passed from standard main method
     */
    public static String[] parseArgs(String[] args) {

        String option = "";
        String who = "world";

        if (args.length > 1) {
            option = args[0];
            who = args[1];
        } else if (args.length == 1) {
            if (args[0].startsWith("-")) {
                option = args[0];
            } else {
                who = args[0];
            }
        }

        String[] p = new String[2];
        p[0] = option;
        p[1] = who;

        return p;

    }

    public static void main(String[] args) throws InterruptedException {

        String[] p = parseArgs(args);
        String option = p[0];
        String who = p[1];

        String message = "Hello " + who + "!";

        if (option.equals("-m")) {
            multi(message);
        } else if (option.equals("-c")) {
            color(message);
        } else {
            plain(message);
        }
    }
}
