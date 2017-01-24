class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string, :limit => 200, :after => :email      #加密后的密码存储
  end
end
