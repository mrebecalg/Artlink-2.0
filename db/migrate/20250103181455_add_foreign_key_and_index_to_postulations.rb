class AddForeignKeyAndIndexToPostulations < ActiveRecord::Migration[8.0]
  def change
    # Agregar la clave foránea
    add_foreign_key :postulations, :users, column: :sender_id

    # Agregar un índice único en sender_id
    add_index :postulations, :sender_id, unique: true
  end
end
