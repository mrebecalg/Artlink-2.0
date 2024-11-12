class AddProfileFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :biography, :text
    add_column :users, :facebook, :string
    add_column :users, :x, :string
    add_column :users, :instagram, :string
  end
end
