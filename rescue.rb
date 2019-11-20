begin
  File.open("random_file_001.txt")
rescue Errno::ENOENT
  puts "File not found :("
end
