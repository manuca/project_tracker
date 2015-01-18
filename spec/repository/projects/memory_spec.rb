require 'spec_helper'
require 'support/common_repository_examples'

module ProjectTracker
  module Repository
    module Projects
      describe Memory do
        let(:repository) { Memory.new }
        it_behaves_like "a repository"
      end
    end
  end
end
