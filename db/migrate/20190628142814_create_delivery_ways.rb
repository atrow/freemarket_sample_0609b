class CreateDeliveryWays < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_ways do |t|
      t.string :delivery_way, null: false
      t.timestamps
    end
  end
end
