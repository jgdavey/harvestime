module Harvestime
  class TimeDifference
    attr_accessor :start_time, :end_time

    def initialize(start_time, end_time)
      self.start_time = start_time
      self.end_time   = end_time
    end

    def self.parse(range)
      return "" unless range
      times = range.split(" - ", 2).map do |str|
        hours, minutes = str.split(":").map {|s| s.to_i}
        Time.at((hours*3600) + (minutes*60)).gmtime
      end
      new(*times).formatted
    end

    def difference
      end_time - start_time
    end

    def formatted
      Time.at(difference).gmtime.strftime('%k:%M')
    end
    alias to_s formatted
  end
end
