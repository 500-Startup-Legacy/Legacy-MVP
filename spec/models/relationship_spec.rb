require 'rails_helper'

RSpec.describe Relationship, type: :model do

  let(:memorializer) { FactoryGirl.create(:user) }
  let(:memorialized) { FactoryGirl.create(:user) }
  let(:relationship) { memorializer.relationships.build(memorialized_id: memorialized.id, group: 'family') }

  subject { relationship }

  it { should be_valid }
  it { should respond_to :memorializer }
  it { should respond_to :memorialized }

  describe "#group" do
    it { should respond_to :group }
    describe "when a group is not present" do
      before { relationship.group = nil }
      it { should_not be_valid }
    end

    describe "when group is not friend, family, or coworker" do
      before { relationship.group = 'frenemy' }
      it { should_not be_valid }
    end

    describe "when group validates" do

      describe "with friend" do
        before {relationship.group = 'friend' }
        it { should be_valid }
      end

      describe "with coworker" do
        before {relationship.group = 'coworker' }
        it { should be_valid }
      end

    end
  end

  describe "memorializer methods" do
    it { expect(relationship.memorializer).to eq memorializer }
    it { expect(relationship.memorialized).to eq memorialized }
  end
end
