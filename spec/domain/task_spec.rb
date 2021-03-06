require 'spec_helper'
require 'time'

module ProjectTracker
  describe Task do
    let(:tennant) { Tennant.new("A Tennant") }
    let(:worker)  { Worker.new(tennant, "Dude working") }

    it "instantiates with basic attributes" do
      date = Date.today
      description = "a description"
      start_time  = "12:00"
      finish_time = "13:00"

      task = Task.new(worker, date, start_time, finish_time, description)

      expect(task.worker).to eq(worker)
      expect(task.date).to eq(date)
      expect(task.start_time).to  eq(Time.parse(start_time))
      expect(task.finish_time).to eq(Time.parse(finish_time))
      expect(task.description).to eq(description)
    end

    it "raises error with inconsistent start/finish times" do
      expect { Task.new(worker, Date.today, "13:00", "11:00", "a task") }.
        to raise_error(RuntimeError, "start time must precede finish time")
    end
  end
end
