# fast tracker
require 'date'
date_fast_ends = Time.new(2019,11,15,07,00,00,00)
date_now = Time.now
#p date_fast_ends
#p date_now
diff = ((date_fast_ends - date_now) / 3600).round(2)
diff = diff.to_s.split('.')
hours = diff[0]
# Current bug .75 means 75% or 45 minutes, currently printing 75 minutes
# convert eg 75 to float (75.0)
p diff[1]
minutes = 60 * (diff[1].to_f / 100) # change to .75 and back to string literal
minutes = minutes.floor.round(0)
minutes = minutes.to_i
puts "Your current fast ends in #{hours} hours and #{minutes} minutes."
