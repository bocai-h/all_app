require 'rails_helper'

class PageTitleTest < ActionDispatch::IntegrationTest
  describe "every page",:type => :feature do
    let(:base_title){ "All app" }
    describe "Home page" do
      it "should have title 'All app'" do
        visit root_path
        expect(page).to have_title("All app")
      end
    end

    describe "Login page" do
      it "should have title 'login'" do
        visit sign_in_path
         expect(page).to have_title("#{base_title} | login")
      end
    end

    describe "Sign up page" do
      it "should have title 'sign up'" do
        visit sign_up_path
        expect(page).to have_title("#{base_title} | sign up")
      end
    end
  end
end
