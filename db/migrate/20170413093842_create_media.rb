class CreateMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :media do |t|
      t.string :name
      t.string :source
      t.string :target
      t.string :status
      t.timestamps
    end
  end
end
