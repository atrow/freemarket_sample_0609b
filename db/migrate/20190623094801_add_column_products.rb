class AddColumnProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :condition, null: false, foreign_key: true
    add_reference :products, :brand, null: false, foreign_key: true
    add_reference :products, :delivery_fee_pay, null: false, foreign_key: true
    add_reference :products, :delivery_off_area, null: false, foreign_key: { to_table: :regions }
    add_reference :products, :delivery_off_day, null: false, foreign_key: true
    add_reference :products, :category, null: false, foreign_key: true
    add_reference :products, :product_status, null: false, foreign_key: true
  end
end
