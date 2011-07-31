$:.unshift File.expand_path("../lib", __FILE__)

require 'pry'

require 'harvestime'

def time_at(timestring)
  hours, minutes = timestring.split(":")
  Time.at((3600 * hours.to_i) + (60 * minutes.to_i)).gmtime
end
