module ProjectTracker
  module Repository
    module Projects
      class Memory
        def initialize
          @id       = 0
          @tasks    = Hash.new {|h, k| h[k] = Array.new }
          @projects = Hash.new
        end

        def find(id)
          @projects[id]
        end

        def save(instance)
          instance.id         = next_id
          instance.repository = self
          @projects[instance.id] = instance
        end

        def add_task(project, task)
          @tasks[project.id] << task
        end

        def remove_task(project, task)
          @tasks[project.id].reject! do |t| 
            task.date == t.date &&
              task.start_time == t.start_time &&
              task.finish_time == t.finish_time
          end
        end

        def tasks(project)
          @tasks[project.id]
        end

        private

        def next_id
          @id += 1
        end
      end
    end
  end
end
