class RemoveColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :gender, :integer
  end
end
