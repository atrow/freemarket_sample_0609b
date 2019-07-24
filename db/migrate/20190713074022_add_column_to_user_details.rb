class AddColumnToUserDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :user_details, :phone, :string
  end
end
