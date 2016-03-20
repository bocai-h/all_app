class User < ActiveRecord::Base
  self.table_name = "users"
  validates_presence_of :user_name, :first_name
  validates_uniqueness_of :email_address
  VALIDATE_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email_address, presence:true, format: { with: VALIDATE_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end
