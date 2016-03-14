class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, :limit => 100,:null => false                #用户名
      t.string :email_address, :limit => 50, :null => false            #用户邮箱地址
      t.string :first_name, :limit => 50, :null => false               #名
      t.string :last_name, :limit => 50                                 #姓
      t.string :status_code, :limit => 30                               #状态
      t.string :created_by, :limit => 36, :collate => "utf8_bin"      #创建人
      t.string :updated_by, :limit => 36, :collate => "utf8_bin"      #更新人
      t.timestamps
    end
    change_column :users, :id, :string, :limit => 36, :collate => "utf8_bin"
    add_index :users, :email_address, unique: true
  end
end
