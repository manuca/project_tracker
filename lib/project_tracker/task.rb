require 'time'

module ProjectTracker
  class Task
    attr_reader :date, :description, :start_time, :finish_time

    def initialize(date, start, finish, description)
      s = Time.parse(start,  date)
      f = Time.parse(finish, date)
      raise "start time must precede finish time" if s > f

      @date        = date
      @description = description
      @start_time  = start
      @finish_time = finish
    end
  end
end
