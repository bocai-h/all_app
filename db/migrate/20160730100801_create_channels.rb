class CreateChannels < ActiveRecord::Migration[5.0]
  def change
    create_table :channels do |t|
      t.string :name                                            #房间名称
      t.string :description                                     #房间描述
      t.integer :person_limit                                   #房间人数
      t.timestamps
    end
  end
end
