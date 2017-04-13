class AddTypeToMedium < ActiveRecord::Migration[5.0]
  def change
    add_column :media,:type,:string,after: :name
  end
end
