require 'spec_helper'

module ProjectTracker
  describe Project do
    before(:all) do
      Repository.register(:projects, Repository::Projects::Memory.new)
    end

    let(:client)           { Client.new("A small agency") }
    let(:task_date)        { Date.today }
    let(:task_description) { "a couple of changes" }
    let(:start_time)       { "12:00" }
    let(:finish_time)      { "13:00" }
    let(:task)             { Task.new(task_date, start_time, finish_time, task_description) }
    let(:project)          { Project.new("Test project", client) }

    describe "#new" do
      it "instantiates object with basic attributes" do
        project = Project.new("Testing project", client)

        expect(project.name).to eq("Testing project")
        expect(project.client).to eq(client)
      end
    end

    describe "#add_task" do
      it "raises error if project is not persisted" do
        expect { project.add_task(task) }.
          to raise_error(RuntimeError, "instance not persisted")
      end

      it "stores a task" do
        Repository.for(:projects).save(project)
        project.id
        project.add_task(task)
        expect(project.tasks.count).to eq(1)

        retrieved_task = project.tasks.first
        expect(retrieved_task.date).to eq(task_date)
        expect(retrieved_task.start_time).to eq(start_time)
        expect(retrieved_task.finish_time).to eq(finish_time)
        expect(retrieved_task.description).to eq(task_description)
      end
    end

    describe "#remove_task" do
      before do
        Repository.for(:projects).save(project)
        project.add_task(task)
      end

      it "removes stored task" do
        project.remove_task(task)
        expect(project.tasks.count).to eq(0)
      end
    end
  end
end
