class AddRememberTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :remember_token, :string, :limit => 200      #用户记忆永久标识
    add_index :users, :remember_token
  end
end
