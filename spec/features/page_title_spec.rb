require 'rails_helper'
require 'helpers'

class PageTitleTest < ActionDispatch::IntegrationTest
  describe "every page" do
    let(:base_title){ "All app" }
    describe "Home page" do
      it "should have title 'All app'" do
        visit root_path
        expect(page).to have_title(full_title(""))
      end
    end

    describe "Login page" do
      it "should have title 'login'" do
        visit sign_in_path
         expect(page).to have_title(full_title("login"))
      end
    end

    describe "Sign up page" do
      it "should have title 'sign up'" do
        visit sign_up_path
        expect(page).to have_title(full_title("sign up"))
      end
    end
  end
end
