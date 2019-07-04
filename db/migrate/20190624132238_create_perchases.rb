class CreatePerchases < ActiveRecord::Migration[5.2]
  def change
    create_table :perchases do |t|
      t.decimal :payment
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
