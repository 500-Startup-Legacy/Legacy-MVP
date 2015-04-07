require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  describe "The homepage" do
    it "has the correct title" do
      visit root_path
      expect(page).to have_title('Legacy')
    end
  end
end
