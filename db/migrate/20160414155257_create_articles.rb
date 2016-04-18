class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, :limit => 50,:null => false                      #标题
      t.string :content, :limit => 500, :null => false                  #内容
      t.string :author, :limit => 32, :null => false                    #作者
      t.string :status_code, :limit => 30                               #状态
      t.string :created_by, :limit => 36, :collate => "utf8_bin"      #创建人
      t.string :updated_by, :limit => 36, :collate => "utf8_bin"      #更新人
      t.timestamps null: false
    end
    change_column :articles, :id, :string, :limit => 36, :collate => "utf8_bin"
  end
end
