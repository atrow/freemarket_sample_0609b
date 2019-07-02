class RenameColumnRegionId < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :region_id, :prefecture_id
    rename_column :user_details, :region_id, :prefecture_id
    rename_column :user_deriveries, :region_id, :prefecture_id
  end
end
