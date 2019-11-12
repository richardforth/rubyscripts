if ARGV.length > 1; then
        puts "Usage: mynameis <firstname>"
        exit
elsif  ARGV.length == 0; then
        puts "Usage: mynameis <firstname>"
        exit
end

puts "Hello #{ARGV[0]}"
