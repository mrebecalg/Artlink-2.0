class ChangeUsernameTypeInUsers < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :username, :string

    # Agregar un índice único en la columna `username`
    add_index :users, :username, unique: true
  end
end
