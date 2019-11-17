require 'highline'
# run 'gem install highline' at a command  prompt

# from / based on documentation
# link: https://www.rubydoc.info/gems/highline/2.0.3
cli = HighLine.new # this is required code to get 'cli' to work below

# Reading passwords:
password1 = cli.ask("\nEnter your password (1):  ") { |q| q.echo = false }
puts " You actually typed : #{password1}" # my debug code added

password2 = cli.ask("\nEnter your password (2):  ") { |q| q.echo = "x" }
puts " You actually typed : #{password2}" # my debug code added

password3 = cli.ask("\nEnter your password (3):  ") { |q| q.echo = "*" }
puts " You actually typed : #{password3}" # my debug code added

# seems a bit clunky if cli.ask is invoked after each run, the next
# ask doesnt appear until after another keypress after RETURN, however
# pressing RETURN a second time actually inputs to the second ask!
<<example
Enter your password (1):
 You actually typed : Sesame

Enter your password (2):  xxxxxx
 You actually typed : Sesame

Enter your password (3):  ******
 You actually typed : Sesame
example

name = cli.ask("What is your name? ")
puts "Hello #{name}, nice to meet you!"
# What is your name? ichard
# Hello Richard, nice to meet you!

# .. See what its doing to that 1st 'R' character? yet its read it in correctly!?
# there seems to be some sort of delay. only on next keypress after RETURN does
# the next question appear, even though its remembered the keypress. Wierd.
# I get the same in powershell too, not sure about linux systems yet, will confirm.
