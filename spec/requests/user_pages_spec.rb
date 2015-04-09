require 'rails_helper'

RSpec.describe "UserPages", type: :request do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before(:each) { visit user_path(user) }

    it { should have_content(user.full_name) }
  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content 'Sign up' }
  end

end
