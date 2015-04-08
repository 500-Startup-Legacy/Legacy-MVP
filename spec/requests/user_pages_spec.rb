require 'rails_helper'

RSpec.describe "UserPages", type: :request do

  subject { page }

  describe "Signup Page" do
    before { visit signup_path }

    it { should have_content 'Sign up' }
  end

end
