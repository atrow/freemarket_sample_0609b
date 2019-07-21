class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :products, :brand_id, null: true
  end
end
