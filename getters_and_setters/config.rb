module Config

  # constants can always be accessed directly with :: notation
  TITLE = "Getters and Setters Example Program"
  VERSION = "0.1"
  AUTHOR = "Richard A. Forth"

  # Getters and Setters
  @timeout = 10
  # get access to a instance @variable with . notation and via methods
  # known as getters and setters
  def self.get_timeout
    @timeout
  end

  def self.set_timeout(value)
    @timeout = value
  end
end
