class DropColumnPerchase < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :perchases_id
  end
end
