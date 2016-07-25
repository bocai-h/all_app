require 'rails_helper'

class SignUpContentTest < ActionDispatch::IntegrationTest
  describe "Sign up",:type => :feature do
    describe "Sign up content" do
      it "should have content 'Sign up!'" do
        visit 'sign_up'
        expect(page).to have_content('Sign up!')
      end
    end
  end
end
