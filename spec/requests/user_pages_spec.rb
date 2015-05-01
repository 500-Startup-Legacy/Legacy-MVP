require 'rails_helper'

RSpec.describe "UserPages", type: :request do

  subject { page }

  # describe "profile page" do
  #   let(:user) { FactoryGirl.create(:user) }
  #   before(:each) { visit user_path(user) }
  #   it { should have_content(user.full_name) }
  # end

  describe "signup page" do
    before { visit signup_path }

    let(:submit) { 'Create Account' }

    it { should have_content 'myJourney' }

    describe "with invalid information" do
      it "should not create a new user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before(:each) do
        fill_in "First Name", with: "Juan"
        fill_in "Last Name", with: "Smith"
        fill_in "Email", with: "juan@smith.com"
        fill_in "Phone Number", with: "222-222-2222"
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a new user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving user" do
        before { click_button submit }
        let(:user) { User.find_by(email: "juan@smith.com") }

        it { should have_link 'Log Out' }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end

    end
  end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do 
      sign_in(user)
      visit edit_user_path(user) 
    end

    describe "page" do
      it { should have_content "Update your profile" }
    end

    describe "with invalid save information" do
      before { click_button "Save changes" }
      it { should have_content "error" }
    end

    describe "with valid save information" do
      let(:new_first_name) { "Newfirstname"}
      let(:new_last_name) { "Newlastname"}
      let(:new_email) { "new@new.com"}

      before do
        fill_in "First Name", with: new_first_name
        fill_in "Last Name", with: new_last_name
        fill_in "Email", with: new_email
        fill_in "Password", with: user.password
        fill_in "Confirmation", with: user.password
        click_button "Save changes"
      end

      it { should have_selector('div.alert.alert-success') }
      specify { expect(page.current_path).to eq user_path(user) }
      specify { expect(user.reload.first_name).to eq new_first_name }
      specify { expect(user.reload.last_name).to eq new_last_name }
      specify { expect(user.reload.email).to eq new_email }
    end

  end

end
