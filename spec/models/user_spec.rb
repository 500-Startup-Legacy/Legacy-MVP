require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    # @juan = FactoryGirl.create(:user)
    @juan = User.new(first_name:'Juan', last_name: 'Smith', email:'juan@smith.com', password: 'foobar', password_confirmation: 'foobar', phone_number: '2222222222')
  end

  subject { @juan }

  it { should respond_to :remember_token }
  it { should respond_to :authenticate }
  it { should respond_to :relationships }
  it { should respond_to :memorialized_users }
  it { should respond_to :memorialize! }
  it { should respond_to :unmemorialize! }
  it { should respond_to :reverse_relationships }
  it { should respond_to :memorializers }
  it { should respond_to :remembrances }
  it { should respond_to :public }
  it { should respond_to :phone_number }

  it { should respond_to :memories }

  describe "when a first name, last name, phone number, and email are present" do
    it { should be_valid }
  end

  describe "when phone number is not present" do
    before { @juan.phone_number = nil }
    it { should_not be_valid }
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

  describe "when a phone number has dashes in it" do
    before do
      @juan.phone_number = '222-222-2222'
      @juan.save
    end
    it 'should be saved without the dashes' do
      expect(@juan.phone_number).to eq('2222222222')
    end
  end

  describe "when a phone number starts with a 1" do
    before do
      @juan.phone_number = '1-222-222-2222'
      @juan.save
    end
    it 'should be saved without the initial 1' do
      expect(@juan.phone_number).to eq('2222222222')
    end
  end

  describe "when a phone number has non-numerical chararacters" do
    before do
      @juan.phone_number = '1-222-hello-2222'
      @juan.save
    end
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

  describe "memorializing" do
    let(:other_user) { FactoryGirl.create(:user) }
    before do
      @juan.save
      @juan.memorialize!(other_user, "family")
    end
  
    it { should be_memorializing other_user }
    specify { expect(@juan.memorialized_users).to include(other_user) }

    describe "memorialized user" do
      subject { other_user }
      specify { expect(other_user.memorializers).to include(@juan) }
    end

    describe "and unmemorializing" do
      before { @juan.unmemorialize! other_user }
      it { should_not be_memorializing other_user }
      specify { expect(@juan.memorialized_users).to_not include(other_user) }
    end
  end

  describe "memory association" do
    before { @juan.save }
    let!(:older_memory) { FactoryGirl.create(:memory, user:@juan, created_at: 1.day.ago) }
    let!(:newer_memory) { FactoryGirl.create(:memory, user:@juan, created_at: 1.hour.ago) }

    it "should return the right memories in the right order" do
      expect(@juan.memories.to_a).to eq [newer_memory, older_memory]
    end

    it "should destroy associated memories" do
      memories = @juan.memories.to_a
      @juan.destroy
      expect(memories).not_to be_empty
      memories.each do |memory|
        expect(Memory.where(id: memory.id)).to be_empty
      end
    end

  end

  describe "#remembrances" do
    before { @juan.save }
    let(:other_user) { FactoryGirl.create(:user) }
    let!(:memory_1) { FactoryGirl.create(:memory, user:other_user, memorialized_user_id:@juan.id) }
    let!(:memory_2) { FactoryGirl.create(:memory, user:other_user, memorialized_user_id:@juan.id) }
    let!(:memory_3) { FactoryGirl.create(:memory, user:other_user, memorialized_user_id:7) }

    it "returns an collection of memories other users have had about it" do
      expect(@juan.remembrances.to_a).to eq [memory_2, memory_1]
    end

  end

end
