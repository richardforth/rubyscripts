# require "./config.rb" # Linux
require_relative "config" # Windows

Title = Config::TITLE
Version = Config::VERSION
Author = Config::AUTHOR
Cities = Config::CITIES

puts "#{Title} #{Version} by #{Author}"
puts

puts Cities
