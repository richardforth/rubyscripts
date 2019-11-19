require 'highline'

cli = HighLine.new

name = cli.ask("What is your name?")
puts "Hello #{name}, we meet again..."

rank = cli.ask("What is your rank?")
puts "Hello #{rank}, welcome back!"

# so far so good, no lag

<<STILLNOTWORKINGHOWIWANT
password = cli.ask("What is your password? ") { |q|
    q.echo = "*"
}




foo = Proc.new { |prompt| prompt.echo = false }
password = cli.ask("Enter your new password: ", &foo)
# same....wonder if its a windows thing?
STILLNOTWORKINGHOWIWANT

# from stackoverflow
# link: https://stackoverflow.com/questions/2338889/how-to-hide-password-input-from-terminal-in-ruby-script
require 'io/console'
print "Enter your password, #{rank}: "
password = STDIN.noecho(&:gets).chomp
puts

unless password == "SkyFall"
  puts "Impostor! Guards! Take him away"
else
  puts "Come on in, Q needs to speak to you first."
end
<<PERFECT
What is your name?
Bond
Hello Bond, we meet again...
What is your rank?
007
Hello 007, welcome back!
Enter your password, 007:
Come on in, Q needs to speak to you first.
PERFECT

# Verdict - not a fan of the ask thing, will try other things
# such as the menu selector later...
