class CreateUserGenerals < ActiveRecord::Migration
  def change
    create_table :user_generals do |t|
      t.references :user,index: true,foreign_key: true
      t.string :name,:limit => 50,:null => false                  #姓名
      t.integer :age,:null => false                                #年龄
      t.string :sex,:limit => 10,:null => false                   #性别
      t.string :hobby,:limit => 150                                #兴趣爱好
      t.string :mobile_phone,:limit => 20,:null => false         #联系方式
      t.string :address,:limit => 100                              #住址
      t.timestamps null: false
    end
  end
end
