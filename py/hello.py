"""Not yo grandma's hello world module.

This module is a collection of functions that can be called
from programs or other modules that import it. 

Notice there is no shebang line because there is no ``if __name__
== '__main__'`` section in this module, although it could have one
for testing, etc.

This documentation can be displayed with ``pydoc3 hello``
or converted to web page with any number of tools.

"""

import skilstak.colors as c
import time

def print_plain(message):
    """Prints <message> to the screen.

    Args:
        message (str): message to print 

    """
    print(message)

def print_foreva(message):
    """ Prints <message> to the screen forever (without line return)

    Args:
        message (str): message to print forever

    """
    while True:
        print(message,end=" ")

def print_multi(message):
    """Prints <message> in multiple colors like a Christmas tree (or Vegas sign).

    Args:
        message (str): message to print 

    """
    while True:
        print(c.clear + c.multi(message))
        time.sleep(0.5)

def print_color(message):
    """Fills the screen with randomly colored <message>s.
    
    Args:
        message (str): message to print 

    """
    print(c.clear)
    while True:
        print(c.rc() + message + c.reset, end=" ")

def print_merica(message):
    """Fills the screen with politically correctly colored <message>.
    
    Args:
        message (str): message to print 

    """
    print(c.clear)
    while True:
        print(c.merica(message), end=" ")

def parse_args():
    """Parse and return properties from the command line.

    Program accepts any of the following:

        hello
        hello You
        hello -c
        hello -m
        hello -c You
        hello -m You
   
    Returns:
        dict: A dictionary of properties (who, option)

    """

    # import here instead of top since only this function uses
    import sys

    # create a dictionary to hold our values
    p = {
        "who": "world",
        "option": ""
    }

    if len(sys.argv) > 2:
        p['option'] = sys.argv[1]
        p['who'] = sys.argv[2]
    elif len(sys.argv) == 2:
        if sys.argv[1].startswith("-"):
            p['option'] = sys.argv[1]
        else:
            p['who'] = sys.argv[1]
    return p 

