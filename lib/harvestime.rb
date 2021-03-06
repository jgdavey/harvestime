require "harvestime/version"
require "harvestime/day"
require "harvestime/line"
require "harvestime/entry"

module Harvestime
  FORMAT = /(\d\d:\d\d - \d\d:\d\d)(?: ([ \d]\d:\d\d)? ?(.+)?)?$/

  class << self
    def convert(line)
      if line =~ FORMAT
        Line.new(line).convert
      else
        line
      end
    end

    def total(string)
      Day.new(get_lines(string)).total
    end

    private
    def get_lines(string)
      string = string.split("\n") if string.respond_to? :split
      string.map do |line|
        next unless line =~ FORMAT
        Line.new(line)
      end.compact
    end
  end

end
