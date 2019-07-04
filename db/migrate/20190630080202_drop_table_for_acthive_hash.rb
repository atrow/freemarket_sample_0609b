class DropTableForActhiveHash < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :products, :conditions
    remove_index :products, :condition_id
    remove_foreign_key :products, :delivery_fee_pays
    remove_index :products, :delivery_fee_pay_id
    remove_foreign_key :products, :delivery_off_days
    remove_index :products, :delivery_off_day_id
    remove_foreign_key :products, :regions
    remove_index :products, column: :delivery_off_area_id, name: 'index_products_on_delivery_off_area_id'
    remove_foreign_key :products, :product_statuses
    remove_index :products, :product_status_id
    remove_foreign_key :sizes, :size_types
    remove_index :sizes, :size_type_id
    remove_foreign_key :categories, :size_types
    remove_index :categories, column: :size_types_id, name: 'index_categories_on_size_types_id'
    remove_foreign_key :users, :regions
    remove_index :users, column: :region_id, name: 'index_users_on_region_id'
    remove_foreign_key :user_deriveries, :regions
    remove_index :user_deriveries, column: :region_id, name: 'index_user_deriveries_on_region_id'
    remove_foreign_key :user_details, :regions
    remove_index :user_details, column: :region_id, name: 'index_user_details_on_region_id'
    remove_foreign_key :user_ditails, :regions
    remove_index :user_ditails, column: :region_id, name: 'index_user_ditails_on_region_id'
    remove_foreign_key :user_ditails, :users
    remove_index :user_ditails, column: :user_id, name: 'index_user_ditails_on_user_id'
    drop_table :conditions
    drop_table :delivery_fee_pays
    drop_table :delivery_off_days
    drop_table :delivery_ways
    drop_table :product_statuses
    drop_table :regions
    drop_table :size_types
    drop_table :sizes
    drop_table :user_ditails
    rename_column :categories, :size_types_id, :size_type_id
    rename_column :brands, :brand_name, :brand
  end
end
