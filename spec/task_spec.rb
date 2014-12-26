require 'spec_helper'

module ProjectTracker
  describe Task do
    it "instantiates with basic attributes" do
      date = Date.today
      description = "a description"
      start_time  = "12:00"
      finish_time = "13:00"

      task = Task.new(date, start_time, finish_time, description)

      expect(task.date).to eq(date)
      expect(task.start_time).to  eq(start_time)
      expect(task.finish_time).to eq(finish_time)
      expect(task.description).to eq(description)
    end

    it "raises error with inconsistent start/finish times" do
      expect { Task.new(Date.today, "13:00", "11:00", "a task") }.
        to raise_error(RuntimeError, "start time must precede finish time")
    end
  end
end
