require 'rails_helper'

RSpec.describe Memory, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:memorialized_user) { FactoryGirl.create(:user) }
  before do
    user.memorialize!(memorialized_user, 'family')
    @memory = user.memories.build(content:'Lorum ipsum', memorialized_user_id: memorialized_user.id)
  end

  subject { @memory }

  it { should respond_to :content }
  it { should respond_to :user_id }
  it { should respond_to :memorialized_user_id }
  it { should respond_to :user }
  it { should respond_to :group_tag }
  it { should respond_to :image_url }

  specify { expect(@memory.user).to eq user }

  it { should be_valid }

  describe "when a user id is not present" do
    before { @memory.user_id = nil }
    it { should_not be_valid }
  end

  describe "when a memorialized_user_id is not present" do
    before { @memory.memorialized_user_id = nil }
    it { should_not be_valid }
  end

  describe "#group" do
    it "should return the relationship's group_tag value" do
      relationship = user.relationships.first
      expect(@memory.group_tag).to eq(relationship.group_tag)
    end
  end

end
