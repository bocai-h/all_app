class ChangeUserIdToS < ActiveRecord::Migration
  def change
    change_column :users,:id,:string,:limit => 36,:collate => "utf8_bin" #修改id为string类型
  end
end
