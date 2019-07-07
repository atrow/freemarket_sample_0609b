class ChangeColumnToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :category, :string, null: false
    add_reference :categories, :size, null: false, foreign_key: true
    add_reference :categories, :parent, null: true, foreign_key: { to_table: :categories }
  end
end
