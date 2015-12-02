Goal:
  We want to print Hello to the user or the 'world' by default in
  different ways.

Psuedocode:

  we have a name, by default name is 'world'
  we have an option, by default option is an empty string

  if exactly two arguments (hello -m OR hello Rob) then
    if the second argument starts with '-'
      set the option to the second argument  (argv[1])
    else
      set the name to the second argument (argv[1])

  else if there are more than two arguments (hello -m Rob) then
    set the option to the second argument (argv[1])
    set the name to the third argument (argv[2])

  create our message to the name

  if the option is '-m'
    print message in multiple colors
  else if option is '-c'
    print a randomly colored message
  else if option is '-f'
    print the message forever
  else if option is '-h'
  else
    print a plain ol message

