class AddColumnToProduct < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :perchases, foreign_key: true
  end
end
