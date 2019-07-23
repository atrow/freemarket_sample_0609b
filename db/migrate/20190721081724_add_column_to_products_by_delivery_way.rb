class AddColumnToProductsByDeliveryWay < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :delivery_way_id, :bigint, null: false
  end
end
