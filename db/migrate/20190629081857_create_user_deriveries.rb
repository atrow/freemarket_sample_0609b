class CreateUserDeriveries < ActiveRecord::Migration[5.2]
  def change
    create_table   :user_deriveries do |t|
      t.string     :family_name, null: false
      t.string     :family_name_kana, null: false
      t.string     :first_name, null: false
      t.string     :first_name_kana, null: false
      t.string     :city, null: false
      t.string     :street, null: false
      t.string     :building_name
      t.integer    :zip_code, null: false
      t.integer    :phone
      t.references :region, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
