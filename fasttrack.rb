# fast tracker
require 'date'
date_fast_ends = Time.new(2019,11,15,07,00,00,00)
date_now = Time.now
#p date_fast_ends
#p date_now
diff = ((date_fast_ends - date_now) / 3600).round(2)
diff = diff.to_s.split('.')
hours = diff[0]
minutes = diff[1]
puts "Your current fast ends in #{hours} hours and #{minutes} minutes."
