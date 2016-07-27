require 'rails_helper'

class SignUpContentTest < ActionDispatch::IntegrationTest
  describe "Sign up", :type => :feature do
    subject { page }
    before { visit sign_up_path }
    # it "should have content 'Sign up!'" do
    #   expect(page).to have_content('Sign up!')
    # end
    it { should have_content('Sign up!') }

    # it "shouldn't have content 'login!'" do
    #   expect(page).not_to have_content('Sign in')
    # end
    it { should_not have_content('Sign in') }

  end
end
