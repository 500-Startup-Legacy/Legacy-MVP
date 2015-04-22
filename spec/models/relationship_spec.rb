require 'rails_helper'

RSpec.describe Relationship, type: :model do

  let(:memorializer) { FactoryGirl.create(:user) }
  let(:memorialized) { FactoryGirl.create(:user) }
  let(:relationship) { memorializer.relationships.build(memorialized_id: memorialized.id, group_tag: 'family') }

  subject { relationship }

  it { should be_valid }
  it { should respond_to :memorializer }
  it { should respond_to :memorialized }

  describe "when a memorializer_id is not present" do
    before { relationship.memorializer_id = nil }
    it { should_not be_valid }
  end

  describe "when a memorialized_id is not present" do
    before { relationship.memorialized_id = nil }
    it { should_not be_valid }
  end

  describe "#group_tag" do
    it { should respond_to :group_tag }
    describe "when a group is not present" do
      before { relationship.group_tag = nil }
      it { should_not be_valid }
    end

    describe "when group_tag is not friend, family, or coworker" do
      before { relationship.group_tag = 'frenemy' }
      it { should_not be_valid }
    end

    describe "when group_tag validates" do

      describe "with friend" do
        before {relationship.group_tag = 'friend' }
        it { should be_valid }
      end

      describe "with coworker" do
        before {relationship.group_tag = 'coworker' }
        it { should be_valid }
      end

    end
  end

  describe "memorializer methods" do
    it { expect(relationship.memorializer).to eq memorializer }
    it { expect(relationship.memorialized).to eq memorialized }
  end
end
