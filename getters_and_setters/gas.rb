require_relative 'config'

TITLE = Config::TITLE
VERSION = Config::VERSION
AUTHOR = Config::AUTHOR

puts "#{TITLE} #{VERSION}, by #{AUTHOR}"

puts "Timeout value is #{Config.get_timeout} (getter)"
puts "Setting new timeout value of 30 (setter) ..."
Config.set_timeout(30) # setter
puts "NEW Timeout value is set to #{Config.get_timeout} (getter)"
