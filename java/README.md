# Hello Java

First let's be clear, there are many other better programming
languages for creating command line programs. Java is the worst of
the modern language options. (Golang or Python are practically
always preferred these days.)

This directory is organized as would be found in an Android project.
Separating `src` and `build` is a long standing Java development
best practice that is best to adopt from the very beginning.

The `bin` directory contains runnable helper shell scripts. `make`
contains the code to compile our Java. `hello` is a script that
calls `java hello` since class files cannot be run directly.

This organization may seem a little more complex than other languages
but is actually very simple compared to most you will see later
that use Gradle to handle task management for larger projects.

The `bin/make` is named the same as the UNIX utility `make` to get
you in the habit of simply typing `make`. Indeed `make` is a much
simpler task management tool if you can get away with using it.
Usually most Java project use Gradle and Maven because Java is often
developed on Windows machines in addition to Mac and Linux, (which
just supports our conclusion that it is a horrible language that
you still just have to learn).

