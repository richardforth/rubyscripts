#!/usr/bin/ruby

require 'awesome_print'

#=--------------------------------------------------------=#
# ScriptName : inodium.rb
# Author     : Richard A. Forth
# Email      : richardDOTforthATgmailDOTcom
# Version    : 0.00
# Description: Inode Hunter.
#=--------------------------------------------------------=#

class CircularBuffer
  def initialize(size:)
    @max_size = size
    @buffer = []
  end

  def <<(value)
    if @buffer.size >= @max_size
      @buffer.shift
    end
    @buffer << value unless @buffer.include?(value)
  end

  def size
    @buffer.size
  end

  def highest
    return 0 if @buffer.length == 0
    #@buffer[-1][:count]
    @buffer.sort_by { |hsh| hsh[:count] }[-1][:count]
  end

  def report
    @buffer
  end
end


def is_folder(path)
   File.directory?(path)
end


def scan_inodes(path)

  myTopTwenty << hash if inode_count > myTopTwenty.highest
end


# Create a circular buffer of 20 items.
myTopTwenty = CircularBuffer.new(size: 20)

at_exit do
  puts
  puts
  myTopTwenty.report.sort_by { |hsh| hsh[:count] }.reverse.each do |hash|
    string = "%-30d : %-70s" % [hash[:count], hash[:path]]
    puts string
  end
  puts
  puts "Program terminated at #{Time.now}."
  puts
end


# Get the start position from ARGV, or default to /
if ARGV.length != 1
  puts "Defaulting to /"
  fs = "/"
else
  fs = ARGV[0]
  # CHECK IF THE FOLDER IS A REAL EXISTING FOLDER, OR ABORT.
  puts "FATAL: Not a valid folder,".red unless is_folder(fs)
  exit unless is_folder(fs)
end
puts
title = "Top 20 Directories in #{fs} for inodes"
puts title
puts "=" * title.length
puts
#puts "Scanning, please wait..."
#STDOUT.flush

#p myTopTwenty.highest
begin
  myTopTwenty << {"path": "/var", "count": 34123 }
  myTopTwenty << {"path": "/var/lib", "count": 2334123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php", "count": 32423434123 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/lib/php/session", "count": 341223542345234524297863 }
  myTopTwenty << {"path": "/var/www/", "count": 5635788934123 }
  myTopTwenty << {"path": "/var/www/", "count": 5635788934123 }
  myTopTwenty << {"path": "/var/www/", "count": 5635788934123 }
  myTopTwenty << {"path": "/var/www/", "count": 5635788934123 }
  sleep 120
  myTopTwenty << {"path": "/var/www/", "count": 5635788934123 }
  myTopTwenty << {"path": "/var/www/", "count": 5635788934123 }
  myTopTwenty << {"path": "/var/www/", "count": 5635788934123 }
  myTopTwenty << {"path": "/var/www/", "count": 5635788934123 }
  myTopTwenty << {"path": "/var/www/", "count": 5635788934123 }
  myTopTwenty << {"path": "/var/www/vhosts", "count": 9879685635788934123 }
  myTopTwenty << {"path": "/var/www/vhosts/mydomain.com", "count": 563575654756788934123 }
rescue Interrupt
  exit
end
#p myTopTwenty.highest



#scan_inodes(fs)
#
#puts "YOUR REPORT IS READY:"
#puts
#myTopTwenty.report
