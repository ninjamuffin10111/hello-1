# Goal
  
We want to print Hello to the user or the 'world' by default in
different ways. For example:

```
hello
hello -m
hello Harry
hello -m Harry 
```

## Pseudocode:

```
we have an unchanging (constant) greeting for all ("Hello")
we have a name, by default name is 'world'
we have an option, by default the option is an empty string ("")

if exactly two arguments (hello -m OR hello Harry) then
    if the second argument starts with '-'
      set the option to the second argument
    else
      set the name to the second argument

else if there are more than two arguments (hello -m Harry) then
    set the option to the second argument
    set the name to the third argument

create our message to the name

if the option is '-m'
  print message in multiple colors
else if option is '-c'
  print a randomly colored message
else if option is '-f'
  print the message forever
else
  print a plain 'ol message
```
