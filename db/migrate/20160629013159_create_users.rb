class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name,:limit => 50,:null => false                    #昵称
      t.string :email,:limit => 30,:null => false                   #邮箱
      t.timestamps null: false
    end
  end
end
