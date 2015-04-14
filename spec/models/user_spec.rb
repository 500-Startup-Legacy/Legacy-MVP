require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    # @juan = FactoryGirl.create(:user)
    @juan = User.new(first_name:'Juan', last_name: 'Smith', email:'juan@smith.com', password: 'foobar', password_confirmation: 'foobar')
  end

  subject { @juan }

  it { should respond_to :remember_token }
  it { should respond_to :authenticate }

  describe "when a first name, last name, and email are present" do
    it { should be_valid }
  end

  describe "when a first name is not present" do
    before { @juan.first_name = nil }
    it { should_not be_valid }
  end

  describe "when a last name is not present" do
    before { @juan.last_name = nil }
    it { should_not be_valid }
  end

  describe "when an email address is not present" do
    before { @juan.email = nil }
    it { should_not be_valid }
  end

  describe "when an email address is improperly formed" do
    before { @juan.email = 'bob.com' }
    it { should_not be_valid }
  end

  describe "when an email address has upper case letters" do
    before do 
      @juan.email = 'JuAn@SmItH.cOm' 
      @juan.save
    end
    it 'should be saved completely downcased' do 
      expect(@juan.email).to eq('juan@smith.com' )
    end
  end

  describe "when an email has already been taken by a different user" do
    before do 
      @juan.save
      @carlos = User.new(first_name:'Carlos', last_name: 'Smith', email:'juan@smith.com') 
    end
    subject  {@carlos }
    it { should_not be_valid }
  end

  it "should have a full name" do
    expect(@juan.full_name).to eq(@juan.first_name + " " + @juan.last_name)
  end

  describe "remember token" do
    before { @juan.save }
    it "should not be blank" do
      expect(@juan.remember_token).not_to be_blank 
    end
  end

end
