# fast tracker
require 'date'
date_fast_starts = Time.new(2019,11,12,07,00,00,00)
date_fast_ends = Time.new(2019,11,15,07,00,00,00)
date_now = Time.now
#p date_fast_ends
#p date_now
diff = ((date_fast_ends - date_now) / 3600).round(2)
diff = diff.to_s.split('.')
hours = diff[0]
# Current bug .75 means 75% or 45 minutes, currently printing 75 minutes
# convert eg 75 to float (75.0)
# p diff[1]
minutes = 60 * (diff[1].to_f / 100) # change to .75 and back to string literal
minutes = minutes.floor.round(0)
minutes = minutes.to_i
puts "Your current fast ends in #{hours} hours and #{minutes} minutes."

diff2 = ((date_now - date_fast_starts) /3600).round(2)
diff2 = diff2.to_s.split('.')
hours2 = diff2[0]
# Current bug .75 means 75% or 45 minutes, currently printing 75 minutes
# convert eg 75 to float (75.0)
# p diff[1]
minutes2 = 60 * (diff2[1].to_f / 100) # change to .75 and back to string literal
minutes2 = minutes2.floor.round(0)
minutes2 = minutes2.to_i
puts "You have currently been fasting for #{hours2} hours and #{minutes2} minutes."
puts "Acheivements:"
if hours2.to_i > 72
        puts "* You have completed a 72 hour fast"
        puts "* You have completed a 48 hour fast"
        puts "* You have completed a 24 hour fast"
        puts "* You have completed a 16 hour fast"
        puts "* You have completed an 8 hour fast"
elsif hours2.to_i > 48
        puts "* You have completed a 48 hour fast"
        puts "* You have completed a 24 hour fast"
        puts "* You have completed a 16 hour fast"
        puts "* You have completed an 8 hour fast"
elsif hours2.to_i > 24
        puts "* You have completed a 24 hour fast"
        puts "* You have completed a 16 hour fast"
        puts "* You have completed an 8 hour fast"
elsif hours2.to_i > 16
        puts "* You have completed a 16 hour fast"
        puts "* You have completed an 8 hour fast"
elsif hours2.to_i > 8
        puts "* You have completed an 8 hour fast"
else
        puts ">  Keep going to unlock acheivements!"
end
puts
