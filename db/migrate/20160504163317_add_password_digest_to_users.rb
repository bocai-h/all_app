class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string,:limit => 300,:null => false,:after => :last_name    #存储加密的密码
  end
end
