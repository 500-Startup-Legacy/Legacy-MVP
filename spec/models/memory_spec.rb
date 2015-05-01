require 'rails_helper'

RSpec.describe Memory, type: :model do

  let(:user) { FactoryGirl.create(:user) }
  let(:the_subject) { Subject.create(user:user, group_tag: 'family', name:'Daffy Duck', email:'daffy@duck.com') }
  let(:memory) { Memory.create(subject:the_subject, content: 'Lorum ipsum') }

  subject { memory }
  it { should respond_to :content }
  it { should respond_to :subject_id }

  it { should respond_to :subject }
  it { should respond_to :group_tag }
  it { should respond_to :image_url }

  specify { expect(memory.subject).to eq the_subject }

  it { should be_valid }

  describe "when a subject id is not present" do
    before { memory.subject_id = nil }
    it { should_not be_valid }
  end

  describe "#group" do
    it "should return the subjects's group_tag value" do
      expect(memory.group_tag).to eq(the_subject.group_tag)
    end
  end

end
