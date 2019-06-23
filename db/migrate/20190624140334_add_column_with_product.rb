class AddColumnWithProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :brands, :category, null: false, foreign_key: true
  end
end
