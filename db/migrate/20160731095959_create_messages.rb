class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :channel,index: true,foreign_key: true
      t.text :content,null: false
      t.string :author,null:false

      t.timestamps
    end
  end
end
