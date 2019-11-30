# require "./config.rb"
require_relative "config"

Title = Config::TITLE
Version = Config::VERSION
Author = Config::AUTHOR
Cities = Config::CITIES

puts "#{Title} #{Version} by #{Author}"
puts

puts Cities
