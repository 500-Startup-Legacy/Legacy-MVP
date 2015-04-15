require 'rails_helper'

RSpec.describe Relationship, type: :model do

  let(:memorializer) { FactoryGirl.create(:user) }
  let(:memorialized) { FactoryGirl.create(:user) }
  let(:relationship) { memorializer.relationships.build(memorialized_id: memorialized.id) }

  subject { relationship }

  it { should be_valid }

  describe "memorializer methods" do
    it { should respond_to :memorializer }
    it { should respond_to :memorialized }
    it { expect(relationship.memorializer).to eq memorializer }
    it { expect(relationship.memorialized).to eq memorialized }
  end
end
