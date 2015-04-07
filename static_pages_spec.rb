require 'rails_helper'

RSpec.describe "Static Pages", type: :request do
  describe "Home Page" do

    it "has the app title" do
      visit root_path
      expect(page).to have_title('Legacy')
    end

  end
end
