require 'time'

module ProjectTracker
  class Task
    attr_reader :date, :description, :start_time, :finish_time, :worker

    def initialize(worker, date, start, finish, description)
      s = Time.parse(start,  date)
      f = Time.parse(finish, date)
      raise "start time must precede finish time" if s > f

      @worker      = worker
      @date        = date
      @description = description
      @start_time  = s
      @finish_time = f
    end
  end
end
