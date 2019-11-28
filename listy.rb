puts "Welcome to Listy.rb!"
puts "Please type your todo list item below, enter \"done\" when done:"
item = ""
list = []
until item == "done"
  print "[_] "
  item = gets.chomp
  list << "[_] #{item}"
end

puts "Your list is below:"
puts list
