module ProjectTracker
  module Repository
    # TODO make it thread safe this is globaly mutable 
    def self.register(type, repository)
      @repositories ||= Hash.new
      @repositories[type] = repository
    end

    def self.for(type)
      @repositories[type]
    end
  end
end
