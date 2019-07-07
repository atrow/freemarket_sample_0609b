class CreateDeliveryOffDays < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_off_days do |t|
      t.string :delivery_off_day, null: false
      t.timestamps
    end
  end
end
