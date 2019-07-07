class ChangeNameTablePerchases < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :perchases, :products
    rename_table :perchases, :purchases
    add_foreign_key :purchases, :products
  end
end
