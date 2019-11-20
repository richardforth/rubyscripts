# think fizzbuzz on acid as an example
# fizzbuzz function simplified for this purpose
def fizzbuzz(i)
  if i == 0
    "#{i}: ________"
  elsif (i % 3  == 0) && (i % 5 == 0)
    "#{i}: FizzBuzz"
  elsif i % 5 == 0
    "#{i}: Buzz____"
  elsif i % 3 == 0
    "#{i}: Fizz____"
  else
    "#{i}: ________"
  end
end

def displayResults(results)
  s =  results.size
  #p results
  i = 0
  while i < s
    puts results[i]
    i += 1
  end
end

def displayAlerts(fbi,fi,bi)
  puts "Fizz:"
  print "\t"
  p fi
  puts "Buzz:"
  print "\t"
  p bi
  puts "FizzBuzz:"
  print "\t"
  p fbi
end

# results pane
def main(end_num, results_list, fi_list, bi_list, fbi_list)
  i = 0
  while i <= end_num
    #puts "\e[H\e[2J"
    results_list.push(fizzbuzz(i))
    p results_list
    if results_list[i].include?("FizzBuzz")
      if fbi_list[0].class == String
        fbi_list[0] = i
      else
        fbi_list.push(i)
      end
    elsif results_list[i].include?("Fizz")
      if fi_list[0].class == String
        fi_list[0] = i
      else
        fi_list.push(i)
      end
    elsif results_list[i].include?("Buzz")
      if bi_list[0].class == String
        bi_list[0] = i
      else
        bi_list.push(i)
      end
    end
    fi_list[0] ||= "None."
    bi_list[0] ||= "None."
    fbi_list[0] ||= "None."

    results_list.shift if results_list.length > 10
    displayResults(results_list)
    print "=" * 40
    print " SUMMARY REPORT "
    puts "=" * 40
    displayAlerts(fbi_list, fi_list, bi_list)

    i += 1
    sleep 1
  end
end


results = []
fizz_items = []
buzz_items = []
fizzbuzz_items = []
main(300, results, fizz_items, buzz_items, fizzbuzz_items)
# end report
