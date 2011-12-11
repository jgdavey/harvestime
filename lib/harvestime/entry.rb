module Harvestime
  class Entry
    attr_reader :description, :time
    def initialize(description, time)
      @description, @time = description, time
    end

    def project_name
      return unless description
      description.split(": ").first
    end

    def task_name
      return unless description
      description.split(": ")[1]
    end
  end
end
