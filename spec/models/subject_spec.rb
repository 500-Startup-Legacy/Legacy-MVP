require 'rails_helper'

RSpec.describe Subject, type: :model do

  let(:user) { FactoryGirl.create(:user) }
  let(:the_subject) { Subject.create(user:user, group_tag: 'family', name:'Daffy Duck', email:'daffy@duck.com') }

  subject { the_subject }

  it { should be_valid }
  it { should respond_to :name }
  it { should respond_to :email }
  it { should respond_to :group_tag }
  it { should respond_to :twilio_number }
  it { should respond_to :user }

  describe "when a user_id is not present" do
    before { the_subject.user_id = nil }
    it { should_not be_valid }
  end

  describe "when a group_tag is not present" do
    before { the_subject.group_tag = nil }
    it { should_not be_valid }
  end

  describe "when a name is not present" do
    before { the_subject.name = nil }
    it { should_not be_valid }
  end

  describe "when an email is not present" do
    before { the_subject.email = nil }
    it { should_not be_valid }
  end

  # describe "when an email address has upper case letters" do
  #   before do 
  #     the_subject.email = 'JuAn@SmItH.cOm' 
  #     the_subject.save
  #   end
  #   it 'should be saved completely downcased' do 
  #     expect(the_subject.email).to eq('juan@smith.com' )
  #   end
  # end



end
