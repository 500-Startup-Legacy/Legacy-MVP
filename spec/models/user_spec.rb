require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @juan = User.new(first_name:'Juan', last_name: 'Smith', email:'juan@smith.com')
  end

  subject { @juan }

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

  describe "when an email has already been taken by a different user" do
    before do 
      @juan.save
      @carlos = User.new(first_name:'Carlos', last_name: 'Smith', email:'juan@smith.com') 
    end
    subject  {@carlos }
    it { should_not be_valid }
  end

end
