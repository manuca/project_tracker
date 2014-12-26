module ProjectTracker
  class Entity
    attr_accessor :id
    attr_writer   :repository

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
  end
end
