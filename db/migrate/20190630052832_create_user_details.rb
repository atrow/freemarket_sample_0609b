class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.integer    :zip_code, null: false
      t.string     :city, null: false
      t.string     :street, null: false
      t.string     :building_name
      t.string     :avatar_image
      t.string     :avatar_text
      t.references :user, null: false, foreign_key: true
      t.references :region, null: false, foreign_key: true
      t.timestamps
    end
  end
end
