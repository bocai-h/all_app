class AddIndexUserId < ActiveRecord::Migration
  def change
    add_index :user_generals,:user_id,unique: true         #同一个人只能有一套个人资料
  end
end
