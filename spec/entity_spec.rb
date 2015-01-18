require 'spec_helper'

module ProjectTracker
  describe Entity do
    class TestEntity < Entity; end

    describe "equality" do
      let(:e1) { TestEntity.new }
      let(:e2) { TestEntity.new }

      it { expect(e1).to eq(e1) }
      it { expect(e1).not_to eq(e2) }

      it "entities same ID are considered the same entity" do
        e1.id = e2.id = 1
        expect(e1).to eq(e2)
      end
    end
  end
end
