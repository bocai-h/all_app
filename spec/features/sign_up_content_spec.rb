require 'rails_helper'

class SignUpContentTest < ActionDispatch::IntegrationTest
  describe "Sign up", :type => :feature do
    # page是要测试的对象(不需要写expect(page))
    subject { page }
    before { visit sign_up_path }
    it { should have_content('Sign up!') }
    it { should_not have_content('Sign in') }
  end
end
