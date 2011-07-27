require "harvestime/version"
require "harvestime/line"

module Harvestime
  FORMAT = /(\d\d:\d\d - \d\d:\d\d)(?: ([ \d]\d:\d\d)? ?(.+)?)?$/

  def self.convert(line)
    if line =~ FORMAT
      Line.new(line).convert
    else
      line
    end
  end
end
