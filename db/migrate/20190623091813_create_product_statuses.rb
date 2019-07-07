class CreateProductStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :product_statuses do |t|
      t.string :product_status, null: false
      t.timestamps
    end
  end
end
