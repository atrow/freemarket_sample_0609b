class RenameProductPicture < ActiveRecord::Migration[5.2]
  def change
    rename_column :product_pictures, :product_picture, :image
    rename_table :product_pictures, :images
  end
end
