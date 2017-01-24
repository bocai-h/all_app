class ChangeUserName < ActiveRecord::Migration
  def change
    rename_column :users,:name,:nick_name
  end
end
