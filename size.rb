def usage
  puts "Usage: #{$0} 1234567"
  puts "(size in bytes)"
  exit
end


if ARGV.length == 1
  if ARGV[0].to_i != 0
    bytes = ARGV[0].to_f
    kilobytes = bytes / 1024
    megabytes = kilobytes / 1024
    gigabytes = megabytes / 1024
    terabytes = gigabytes / 1024
    puts "#{bytes} bytes is #{kilobytes} kilobytes."
    puts "#{bytes} bytes is #{megabytes} megabytes."
    puts "#{bytes} bytes is #{gigabytes} gigabytes."
    puts "#{bytes} bytes is #{terabytes} terabytes."
  else
    usage
  end
else
  usage
end
