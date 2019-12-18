#!/usr/bin/ruby

require 'awesome_print'

#=--------------------------------------------------------=#
# ScriptName : inodium.rb
# Author     : Richard A. Forth
# Email      : richardDOTforthATgmailDOTcom
# Version    : 0.00
# Description: Inode Hunter.
#=--------------------------------------------------------=#

@successflag = 0

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


def is_dir?(dir)
  File.directory?(dir)
end

def is_file?(path)
  File.file?(path)
end


def list_one_deep(dir)
  Dir.chdir(dir) do
    everything = Dir.glob("*") # we want hidden files and folders too (.*)
    everythinghidden = Dir.glob(".*") # we want hidden files and folders too (.*)
    # merge
    everything.concat(everythinghidden)
    dirs = []
    everything.each { |item| dirs << dir + item if is_dir?(dir + item) }
    # always remove '.' and '..' from the array to avoid looping
    dirs - [".", ".."]
    dirs
  end
end

def count_files(dir)
  arr = list_one_deep(dir)
  @skipped = []
  arr.each do |dir|
    puts " - #{dir}"
  end
  puts "=" * 80
  totalcount = 0
  arr.each do |path|
    count = 0
    message = "Scanning:#{path} ..."
    @mlen = message.length
    print ("%-50s" % message).gsub(' ', '.')
    STDOUT.flush
    #puts message
    Find.find(path) do |p|
      @skip = 0
      if File.basename(p) == "."
        @skipped << p
        @skip = 1
        Find.prune
      elsif File.basename(p) == ".."
        @skipped << p
        @skip = 1
        Find.prune
      end
      if is_file?(p)
        count += 1
      end
    end
    #print "\r" + (" " * @mlen) + "\r"
    puts '%-10s' % count unless @skip == 1
    totalcount += count
  end
  puts "\nTotal: #{totalcount}"
  puts
  @skipped.each do |i|
    "Skipped: #{i}"
  end
end


# Create a circular buffer of 20 items.
myTopTwenty = CircularBuffer.new(size: 20)

at_exit do
  if @successflag == 1
    puts "\n\nDone.\n"
  else
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
puts
myTopTwenty.report.sort_by { |hsh| hsh[:count] }.reverse.each do |hash|
  string = "%-30d : %-70s" % [hash[:count], hash[:path]]
  puts string
end
puts
