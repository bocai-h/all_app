class AddAdminFlagToUsers < ActiveRecord::Migration
  def change
    add_column :users,:admin_flag,:boolean,:default => false,:after =>:password_digest  #管理员标识
  end
end
