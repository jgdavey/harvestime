module Harvestime
  class Day
    attr_accessor :lines

    def initialize(lines)
      self.lines = lines
    end

    def total
      return if lines.empty?
      minutes = total_minutes
      "%2d:%02d" % [minutes / 60, minutes % 60]
    end

    def total_minutes
      lines.inject(0) do |total, line|
        hours, minutes = line.time_difference.strip.split(":")
        total + (hours.to_i*60) + minutes.to_i
      end
    end
  end
end
