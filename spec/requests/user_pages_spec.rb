require 'rails_helper'

RSpec.describe "UserPages", type: :request do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) { visit user_path(user) }

    # it { should have_content(user.full_name) }
  end

  describe "signup page" do
    before { visit signup_path }

    let(:submit) { 'Create my account' }

    it { should have_content 'Sign up' }

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
        fill_in "Password", with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a new user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving user" do
        before { click_button submit }
        let(:user) { User.find_by(email: "juan@smith.com") }

        it { should have_link 'Sign out' }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end

    end
  end

end
