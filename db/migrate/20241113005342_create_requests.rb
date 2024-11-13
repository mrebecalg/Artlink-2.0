class CreateRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :description
      t.string :contact
      t.string :picture
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :publication_id
      t.timestamps
    end
  end
end
