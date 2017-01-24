require 'rails_helper'

class NavLinkTestSpec < ActionDispatch::IntegrationTest
  describe "nav link" do
    it "should have the right link" do
      visit root_path
      click_link "登录"
      expect(page).to have_title(full_title('login'))
    end
  end
end
