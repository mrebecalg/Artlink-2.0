class AddAccessToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :access, :integer, default: 1
  end
end
