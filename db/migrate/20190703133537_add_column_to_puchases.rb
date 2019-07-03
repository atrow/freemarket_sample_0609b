class AddColumnToPuchases < ActiveRecord::Migration[5.2]
  def change
    add_reference :purchases, :buyer, foreign_key: { to_table: :users }
    add_reference :purchases, :seller, foreign_key: { to_table: :users }
  end
end
