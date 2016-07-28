require 'rails_helper'
require 'helpers'

class PageTitleTest < ActionDispatch::IntegrationTest
  describe "every page" do
    subject { page }
    describe "Home page" do
      before {visit root_path}
      it { should have_title(full_title(""))}
    end

    describe "Login page" do
      before {visit sign_in_path}
      it{ should have_title(full_title("login")) }
    end

    describe "Sign up page" do
      before { visit sign_up_path }
      it { should have_title(full_title("sign up")) }
    end
  end
end
