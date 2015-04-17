require 'rails_helper'

RSpec.describe Memory, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  before do
    @memory = user.memories.build(content:'Lorum ipsum')
  end

  subject { @memory }

  it { should respond_to :content }
  it { should respond_to :user_id }
  it { should respond_to :user }

  specify { expect(@memory.user).to eq user }

  it { should be_valid }

  describe "when a user id is not present" do
    before { @memory.user_id = nil }
    it { should_not be_valid }
  end
end
