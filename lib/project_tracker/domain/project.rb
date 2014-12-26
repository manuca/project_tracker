module ProjectTracker
  class Project < Entity
    attr_reader :name, :client, :tennant

    def initialize(tennant, name, client)
      @tennant = tennant
      @name    = name
      @client  = client
    end

    def add_task(task)
      repository.add_task(self, task)
    end

    def remove_task(task)
      repository.remove_task(self, task)
    end

    def tasks
      repository.tasks(self)
    end
  end
end
