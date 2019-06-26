class CreateDeliveryFeePays < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_fee_pays do |t|
      t.string :delivery_fee_pay, null: false
      t.timestamps
    end
  end
end
