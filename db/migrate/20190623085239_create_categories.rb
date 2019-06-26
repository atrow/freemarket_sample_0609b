class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.boolean :brand_exist, default: true
      t.timestamps
    end
  end
end
