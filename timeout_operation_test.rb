# the pre-amble / aim
# - I need a process that can handle when a given process take too long
# to complete in ruby, and to abandon it and move on
#
# - In this simple test all I want to do is set a process running, for example:
#
# sleep 60
#
# And have some wrapper around it that break out after 15 seconds
#
# Justification:
#
# I need to scab folders for a large amount of files, but on the largest folders
# that process can take a while, and we need to break out and re-focus, for
# example:
#
# ruby filecount /  # times out on /var
# ruby filecount /var/  # times out on /var/lib
# ruby filecount /var/lib/  # times out on /var/lib/php
# ruby filecount /var/lib/php  # times out on /var/lib/php/session
#
# currently / previously, we has to mavually break out at the hange point
# as per the examples above and re-run the script on the directory that hangs
# i want to eventually automate that process by introducing a timeout feature
# but internet research has already warned me against using the Timeout::Timeout
# module as it is "fundamentally broken".
#
require 'rspec/autorun'

class InterruptTest
  def initialize(hash)
    @sleep_time = hash[:sleep_time]
    @timeout_time = hash[:timeout_time]
  end

  def run
    @start_time = Time.now
    sleep @sleep_time
    @end_time = Time.now
  end

  def run_test
    run
    (@end_time - @start_time).round
  end
end

#params = {sleep_time: 15}
#
#test1 = InterruptTest.new(params)
#result = test1.run_test
#p result

describe InterruptTest do
  context "run time no timeout" do
    it "runs for given time" do
      params = {
        sleep_time: 15,
        timeout_time: 10
      }
      mytest1 = InterruptTest.new(params)

      expect(mytest1.run_test).to eq(15)
    end
  end

  context "run time with timeout" do
    it "runs until timeout only" do
      params = {
        sleep_time: 15,
        timeout_time: 10
      }
      mytest1 = InterruptTest.new(params)

      expect(mytest1.run_test).to eq(10)
    end
  end

end
