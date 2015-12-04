# Hello Python

![](https://www.python.org/static/community_logos/python-logo-generic.svg)

Meet Python, the best first programming language anyone should
learn.  It is approachable, easy, and &mdash; most of all &mdash;
real. Python is a core language used by the worldwide scientific
community &mdash; including MIT where it is the first language
taught. Python is commonly put into other applications to give them
script capability and can be found everywhere from elementary schools
to Hollywood &mdash; even on the cover of the Bloomberg Businessweek
dedicated to coding:

![](img/bloomberg.jpg)

## Resources and Requirements

[![][cc0]][cc0link]

This section is for those setting up stuff for students to use
for this project.

Students learn modern Python (3.4+ not 2.7) for many obvious reasons
and will need access to a command-line and `python3` installed.
For most this will be through an ssh connection to a Linux server
for example, `ssh you@skilstak.sh` or using a Raspberry Pi. Students
can also simply use any Mac, which has the command-line needed and
only needs `python3` installed. Others, particularly Windows users,
should install a Linux virtual machine. We don't use Python IDLE
preferring to use the command line as most professionals and colleges
do.

GitHub accounts for each student are strongly recommended with
a `save` shell script like the following to make commits easier:

```shell
#!/bin/sh

comment=save
[ ! -z "$*" ] && comment="$*"

git pull
git add -A .
git commit -a -m "$comment"
git push origin master
```

## Creating A File, UNIX Style

Pros use `vi` and so will we but first here's how we create a file
and make is runnable:

```shell
touch hello
chmod +x hello
```

Some might tell you to use the name `hello.py` but that's just
stupid for a command. No pros do that. It is true, however, that
the `.py` is required if you are making a module, which we aren't,
but will be later. In short, if you are going to be typing it a lot
save the suffix.

## VIM, The One True Editor

Now let's edit it:

```shell
vi hello
```

If you are new to `vi` here are the survival skills you need to use
it without throwing your computer through the window. And whatever
you do, do NOT use `nano`. It creates a wicked, evil habit of typing
`<control>-z` to exit that will plague you the rest of your young
command-line life (because that is the same keys you use to suspend
anything on the command line and put it into the background. Save
yourself the hassle from the beginning.) But I digress:

* `i` - switch to INSERT mode (look in bottom left)
* `<arrows>` - move around in INSERT mode
* `<esc>` - switch to COMMAND mode from INSERT
* `<esc>u` - undo, which you can repeat
* `<esc>:w` - save without exiting vi 
* `<esc>ZZ` or `<esc>:q` - save and exit
* `<esc>ZQ` or `<esc>:q!` - just quit

## `#!`

Believe it or not, this is all you need for a minimal program:

```python
print("Hello world!")
```

To run it this way you need to provide the program to run the code in
the file:

```shell
> python3 hello
```

But no one really wants to type all that in every time. So UNIX has
this thing called a shebang (or sometimes crunchbang). It is a
special line that if found tells the computer what program to use
for the rest of the code in the file, but first you have to set the
executable permission on the text file to signal that it is something
you want to run and not just a regular text file:

```shell
> chmod +x hello
```

Don't worry about the details of permissions and file for now. That
will come in time. Just know when the `x` is added it tells the shell
to look on the first line for a shebang, (or to just assume it is
a shell program, which it isn't in this case):

```python
#!/usr/bin/python3

print("Hello world!")
```

Boom. Runnable:

```shell
> hello
Hello world!
```

## `/usr/bin/env`

There is one last trick to make this program work on *any* computer
that has `python3`. For example, on most Ubuntu Linux systems
`python3` is in `/usr/bin/python3`, while on a Mac where `python3`
has been installed with `brew install python3` it might be in
`/usr/local/bin/python3`. Using the `#!/usr/bin/env python3` shebang
line ensures `python3` will be found where ever it may be:

```python
#!/usr/bin/env python3

print("Hello world!")
```

There. We have a working program with all the right stuff. Wanna
run this on Windows? No problem. Using the Python IDLE will still
work because it thinks the shebang line is just a comment. (But
really why are you using IDLE, no one but students use IDLE, save
yourself the hassle and start out learning it right, like the pros.)

## `if __name__ == '__main__':`

There's one more line that every Python program should have. It
doesn't make sense at first but is very important since it allows
your program to be imported as a module as well as used as a command.
If that doesn't make sense don't worry, just do it for now. You'll
be glad later you did:

```python
#!/usr/bin/env python3

"""The Ever Glorious Hello World Program"""

if __name__ == '__main__':
    print("Hello world!")
```

Notice we added some text as well. That's called a *docstring* and is
essentially ignored by the program but allows us to document our
program as we go so programs like `pydoc3` can do this:

```shell
> pydoc3 ./hello
Help on module hello:

NAME
    hello - The Ever Glorious Hello World Program
```

That might not seem like much now, but believe me, later when you
get thousands of lines of code having a convenient way to document
everything is very nice. Some would go so far as to say that
undocumented code is buggy code. Don't go overboard, but use comments
like this not only for other coders but for your future self.

## Functions

Now is a good time to introduce functions even though it will seem
like too much work initially. We'll see how they help make sense
of everything as we go.

A *function*, which gets its name from math, is like a small program
within a program. Using one is called *calling* a function. In other
words, there are function definitions and function calls. Here's
what they both look like on our little program:

```python
#!/usr/bin/env python3

"""The Ever Glorious Hello World Program"""

# this is a function definition
# vvvvvvvvvvvvvvvv

def print_plain():
    """Print 'Hello world!' in plain text."""
    print("Hello world!")

if __name__ == '__main__':

    # this is a function call
    # vvvvvvvvvvv

    print_plain()

```

We called the function `print_plain` because, you guessed it, we'll
be using other functions for more colorful versions. It is a good
idea to use an active verb as the first word of your functions.
This conveys action and distinguishes them from possible properties,
which we'll discuss later.

You might also notice we use `_` in between the words. This is
standard Python style sometimes called *snake case*. You can
occasionally find Python code that uses JavaScript-like mixed case
(ex: `printPlain`), but the standard is officially snake. Consistency
is always king.

We also added another docstring to document the function. Notice
the following about the code:

1. `def` keyword defines the function name
2. `:` begins the indented block of function code
3. The function itself in a *code block*
4. `print_plain()` the function call

Python is very picky about spaces and tabs, also known as *whitespace*.
Some people *really* hate this about Python, but it has since become
very accepted, even preferred since it ensures code is readable
even when bad programmers write it. You should be using a properly
configured `vim` editor that recognizes your Python code and
automatically indents four spaces for every tab character (not to
mention syntax highlights for you).  If you are not, for example
you are using a Raspberry Pi, do yourself a favor and [get it
working](http://github.com/skilstak/home-config) before you continue.

Note: Python chokes on code that mixes tabs and spaces and will
simply not run.

## Arguments Don't Just Cause Divorce

While teaching about arguments I once said, "Ok, now we are going
to learn about arguments" to which one of my students responded,
"But why, arguments are bad, arguments cause divorce." But programming
arguments are good things

Arguments and parameters are like a vending machine and the money
you put into it. An argument is the slot and the money is the
parameter. Putting the money into the slot is like calling a function
and passing a parameter value. For example, here's our program with
a `message` *argument* and a `"Hello world"` string *parameter*:

```python
#!/usr/bin/env python3

"""The Ever Glorious Hello World Program"""

def print_plain(message):
    """Print <message> in plain text."""
    print(message)

if __name__ == '__main__':
    print_plain("Hello world")

```

## Getting Colorful


[cc0]: http://mirrors.creativecommons.org/presskit/buttons/88x31/svg/cc-zero.svg
"CC0 Public Domain"
[cc0link]: https://creativecommons.org/publicdomain/zero/1.0/
