class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, :limit => 100,:null => false        #用户名
      t.string :email_address, :limit => 50, :null => false    #用户邮箱地址
      t.timestamps
    end
    change_column :users, :id, :string, :limit => 22, :collate => "utf8_bin"
  end
end
