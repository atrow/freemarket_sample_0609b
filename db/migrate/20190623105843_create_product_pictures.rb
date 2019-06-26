class CreateProductPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :product_pictures do |t|
      t.string :product_picture
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
