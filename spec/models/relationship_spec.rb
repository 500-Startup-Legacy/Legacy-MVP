require 'rails_helper'

RSpec.describe Relationship, type: :model do

  # let(:memorializer) { FactoryGirl.create(:user) }
  # let(:memorialized) { FactoryGirl.create(:user) }
  # let(:relationship) { memorializer.relationships.build(memorialized_id: memorialized.id, group_tag: 'family') }

  # subject { relationship }

  # it { should be_valid }
  # it { should respond_to :memorializer }
  # it { should respond_to :memorialized }
  # it { should respond_to :twilio_number }

  # describe "when the app only 3 twilio numbers" do
  #   let(:memorialized2) { FactoryGirl.create(:user) }
  #   let(:memorialized3) { FactoryGirl.create(:user) }
  #   let(:memorialized4) { FactoryGirl.create(:user) }
  #   before do
  #     relationship.save
  #     memorializer.memorialize!(memorialized2, 'family')
  #     memorializer.memorialize!(memorialized3, 'family')
  #   end
  #   it "should not set a twilio_number for additional relationships" do
  #     assert Rails.application.config.twilio_numbers.length == 3
  #     rel4 = memorializer.memorialize!(memorialized4, 'family')
  #     expect(rel4.twilio_number).to be_nil
  #   end
  # end

  # describe "when the app only has 2 twilio numbers" do
  #   let(:memorialized2) { FactoryGirl.create(:user) }
  #   before { Rails.application.config.twilio_numbers = ['2023910271', '7033497371'] }
  #   it "should not allow a user to memorialize more than one users" do
  #     rel2 = memorializer.memorialize!(memorialized2, 'family')
  #     expect(rel2).to be_nil
  #   end
  # end

  # describe "when a memorializer_id is not present" do
  #   before { relationship.memorializer_id = nil }
  #   it { should_not be_valid }
  # end

  # describe "when a memorialized_id is not present" do
  #   before { relationship.memorialized_id = nil }
  #   it { should_not be_valid }
  # end

  # describe "#group_tag" do
  #   it { should respond_to :group_tag }
  #   describe "when a group is not present" do
  #     before { relationship.group_tag = nil }
  #     it { should_not be_valid }
  #   end

  #   describe "when group_tag is not friend, family, or coworker" do
  #     before { relationship.group_tag = 'frenemy' }
  #     it { should_not be_valid }
  #   end

  #   describe "when group_tag validates" do

  #     describe "with friend" do
  #       before {relationship.group_tag = 'friend' }
  #       it { should be_valid }
  #     end

  #     describe "with coworker" do
  #       before {relationship.group_tag = 'coworker' }
  #       it { should be_valid }
  #     end

  #   end
  # end

  # describe "memorializer methods" do
  #   it { expect(relationship.memorializer).to eq memorializer }
  #   it { expect(relationship.memorialized).to eq memorialized }
  # end
end
