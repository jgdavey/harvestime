require "harvestime/time_difference"

module Harvestime
  class Line
    attr_accessor :text, :description, :time_difference, :time_range
    def initialize(text)
      self.text = text
      if matchdata = text.match(FORMAT)
        self.time_range = matchdata[1]
        self.time_difference = matchdata[2]
        self.description = matchdata[3]
      end
    end

    def time_difference
      @time_difference ||= TimeDifference.parse(time_range)
    end

    def convert
      [time_range, time_difference, description].compact.join(" ")
    end
  end
end
