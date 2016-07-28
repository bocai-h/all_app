require 'rails_helper'

class UserModelSpec < ActionDispatch::IntegrationTest
  describe User do
    before { @user = User.new(nick_name: "Bob",email: "Bob@gmail.com") }
    subject { @user }
    it { should respond_to(:nick_name) }
    it { should respond_to(:email) }
  end
end
