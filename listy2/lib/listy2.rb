# List is a special type of object. It is not to be confused with Array
class List
  attr_accessor :name, :items

  def initialize(name)
      @name = name
      @items = []
  end

  # do not allow duplicates
  def <<(item)
    @items << item unless @items.include?(item)
  end

  # print a nicely formatted list with checkboxes
  def print_list
    puts @name
    puts "-" * name.length
    @items.each { |item|
      puts "[_] #{item}"
    }
  end
end






puts "Welcome to Listy.rb!"
print "Please enter a name for your list (ex. \"Shopping\"):"
name = gets.chomp
list = List.new(name)
item = ""
puts "Please type your todo list item below:"
until item == "done"
  print "Type \"done\" to finish adding list items > "
  item = gets.chomp
  list << "#{item}" unless item == "done"
  list.print_list
end
