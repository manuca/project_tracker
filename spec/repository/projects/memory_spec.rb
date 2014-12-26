require 'spec_helper'

module ProjectTracker
  module Repository
    module Projects
      describe Memory do
        let(:client)     { Client.new("Some client") }
        let(:project)    { Project.new("Project name", client) }
        let(:repository) { Memory.new }

        describe "#save" do
          it "saves an instance" do
            repository.save(project)
            expect(project.id).not_to be_nil
            expect(project.repository).to eq(repository)
          end
        end

        describe "#find" do
          it "retrieves project by id" do
            repository.save(project)
            retrieved = repository.find(project.id)
            expect(retrieved).to eq(project)
          end
        end

        let(:task_date) { Date.today }

        describe "when adding task to a project" do
          before do
            repository.save(project)
            repository.add_task(project, Task.new(task_date, "12:00", "13:00", "a task"))
          end

          it "#tasks retrieves the task " do
            tasks = repository.tasks(project)
            expect(tasks.count).to eq(1)
            expect(tasks.first.date).to eq(task_date)
            expect(tasks.first.start_time).to eq("12:00")
            expect(tasks.first.finish_time).to eq("13:00")
            expect(tasks.first.description).to eq("a task")
          end

          it "#remove_task removes the task" do
            repository.remove_task(project, Task.new(task_date, "12:00", "13:00", "a task"))
            expect(repository.tasks(project).count).to eq(0)
          end
        end
      end
    end
  end
end