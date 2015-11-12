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


## The Right Python

Students learn modern Python (3.4+ not 2.7) for many obvious reasons.
On most systems this will mean using `python3` instead of `python`,
which is no big deal.

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
#!/usr/bin/python

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
#!/usr/bin/env python

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
"But why, arguments are bad, arguments cause divorce." So besides
causing divorce arguments are really good things, mostly 'cuz mathz.
Here's our program with an *argument* added to the function and a
*parameter* added to the function call.

```python
#!/usr/bin/env python3

"""The Ever Glorious Hello World Program"""

def print_plain():
    """Print 'Hello world!' in plain text."""
    print("Hello world!")

if __name__ == '__main__':
    print_plain()


```

## Parameters Get Into Arguments

People (including those writing text books) often confuse arguments
and parameters. Strictly speaking arguments receive parameters. A
function is like a candy machine. Arguments are like coin slot on
the candy machine. Parameters are like the coins that go into the
candy machine. Arguments are in the *function signature* (the line
with `def` on it). The parameters are the actual values passed into
the arguments by the function call.
