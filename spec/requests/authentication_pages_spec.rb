require 'rails_helper'

RSpec.describe "Authentication", type: :request do
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }

      before { sign_in user }

      it { should have_link('Log Out', href:signout_path)}
      it { should_not have_link('Sign in', href:signin_path)}

      describe "followed by signout" do
        before { click_link "Log Out" }
        it { should have_link 'Sign in' }
      end
    end

    describe "with invalid information" do
      before { click_button 'Sign in' }
      it { should have_content 'Sign in' }
      it { should have_selector 'div.alert.alert-error' }

      # describe "after visiting another page" do
      #   before { click_link "Home" }
      #   it { should_not have_selector('div.alert.alert-error') }
      # end

    end
  end

end
