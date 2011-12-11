require 'ext/enumerable'

module Harvestime
  class Day
    attr_accessor :lines

    def initialize(lines)
      self.lines = lines
    end

    def total
      return if lines.empty?
      minutes = total_minutes(lines)
      "%2d:%02d" % minutes.divmod(60)
    end

    def total_minutes(lines)
      lines.inject(0) do |total, line|
        hours, minutes = line.time_difference.strip.split(":")
        total + (hours.to_i*60) + minutes.to_i
      end
    end

    def entries
      lines_by_project.map do |desc, lines|
        Entry.new(desc, total_minutes(lines))
      end
    end

    def lines_by_project
      lines.group_by { |l| l.description }
    end
  end
end
