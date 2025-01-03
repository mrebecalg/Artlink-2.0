class CreatePostulations < ActiveRecord::Migration[8.0]
  def change
    create_table :postulations do |t|
      t.string :title
      t.text :content
      t.string :portfolio
      t.integer :sender_id
      t.integer :receiver_id, default: 0
      t.string :status, default: "Pendiente"

      t.timestamps
    end
  end
end
