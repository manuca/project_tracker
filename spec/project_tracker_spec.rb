require 'spec_helper'

module ProjectTracker
  describe ProjectTracker do
    it "registers a repository" do
      repository = Repository::Projects::Memory.new
      Repository.register(:projects, repository)
      expect(Repository.for(:projects)).to eq(repository)
    end
  end
end
