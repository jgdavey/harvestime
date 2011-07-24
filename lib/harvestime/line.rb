require "harvestime/time_difference"

module Harvestime
  class Line
    LINE_MATCH = /(\d\d:\d\d - \d\d:\d\d)(?: ([ \d]\d:\d\d)? ?(.+)?)?$/
    attr_accessor :text, :description, :time_difference, :time_range
    def initialize(text)
      self.text = text
      text.match(LINE_MATCH) do |md|
        self.time_range = md[1]
        self.time_difference = md[2]
        self.description = md[3]
      end
    end

    def time_difference
      @time_difference ||= TimeDifference.parse(time_range).formatted
    end

    def convert
      [time_range, time_difference, description].compact.join(" ")
    end
  end
end
