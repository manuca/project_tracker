module ProjectTracker
  class Project
    attr_reader   :name, :client
    attr_writer   :repository
    attr_accessor :id

    def initialize(name, client)
      @name   = name
      @client = client
    end

    def ==(other)
      if id.nil?
        equal?(other)
      else
        other.kind_of?(self.class) && other.id == id
      end
    end

    alias :eql? :==

    def repository
      raise "instance not persisted" unless @repository
      @repository
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
