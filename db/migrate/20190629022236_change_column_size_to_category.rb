class ChangeColumnSizeToCategory < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :categories, :sizes
    remove_column :categories, :size_id
    add_reference :categories, :size_types, foreign_key: true
  end
end
