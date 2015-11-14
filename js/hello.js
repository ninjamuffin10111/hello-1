/**
 * @author SkilStak Coding Arts <learn@skilstak.com>
 * @copyright 2015 SkilStak, Inc.
 * @license {link http://unlicense.org/|UNLICENSE}
 *
 * @overview
 *
 * Not yo grandma's hello world.
 *
 * This program can be run from the command line (see
 * <code>parseArgs()</code>) or imported as a module
 * <code>var hello = require("hello") so
 * that other programs can use its functions.
 * 
 * This documentation can be displayed with ``pydoc3 ./hello``
 * or converted to web page with any number of tools.
 * 
 */

'use strict';

var out = process.stdout; // instead of console.log()

module.exports = {

  printPlain: function (message) {
    out.write(c.clear + message + "\n");  
  },

  printColor: function (message) {
    while (true) {
      out.write(c.rc() + message + ' ' + c.x);
    }
  },

  printMulti: function (message) {
    setInterval(function () { 
      out.write(c.clear + c.multi(message + " "));
      out.write("\n");
    }, 500);
  },

  parseArgs: function () {
    var who = "world";
    var option = "";
    if (process.argv.length > 3) {
      option = process.argv[2];
      who = process.argv[3];
    } else if (process.argv.length == 3) {
      if (process.argv[2][0] == "-") {
        option = process.argv[2];
      } else {
      who = process.argv[2];
      }
    }
    return {"who":who, "option": option};
  }
}

